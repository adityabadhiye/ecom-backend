package com.example.ecom.api.controller;

import com.example.ecom.service.OrderService;
import com.stripe.Stripe;
import com.stripe.exception.SignatureVerificationException;
import com.stripe.model.Event;
import com.stripe.model.EventDataObjectDeserializer;
import com.stripe.model.StripeObject;
import com.stripe.model.checkout.Session;
import com.stripe.net.Webhook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
public class StripeWebhookController {
    @Autowired
    OrderService orderService;

    @Value("${stripe.api.key}")
    public String stripeKey;

    String stripeWebhookSecret="whsec_p9xc2YUuXsTiS3GZhnZ2KSSgLpEHvqUk";

    @PostMapping(value = "/webhook/stripe-events")
    public void postEventsWebhook(@RequestBody String payload, @RequestHeader("Stripe-Signature") String sigHeader) throws IOException, SignatureVerificationException {

        Stripe.apiKey = stripeKey;

        Event event = Webhook.constructEvent(payload, sigHeader, stripeWebhookSecret);
        EventDataObjectDeserializer dataObjectDeserializer = event.getDataObjectDeserializer();
        StripeObject stripeObject = null;
        if (dataObjectDeserializer.getObject().isPresent())
            stripeObject = dataObjectDeserializer.getObject().get();
        Session checkoutSession;
        long orderId;
        switch (event.getType()) {
            case "checkout.session.completed" -> {
                checkoutSession = (Session) stripeObject;
                assert checkoutSession != null;
//                email = checkoutSession.getCustomerEmail();
                orderId = Long.parseLong(checkoutSession.getClientReferenceId());
                orderService.successOrder(orderId);
            }
            case "checkout.session.expired" -> {
                checkoutSession = (Session) stripeObject;
                assert checkoutSession != null;
//                email = checkoutSession.getCustomerEmail();
                orderId = Long.parseLong(checkoutSession.getClientReferenceId());
                orderService.failOrder(orderId);
            }
        }
    }
}
