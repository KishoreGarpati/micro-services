package com.kishore.services.customerservice;

import com.kishore.Customer;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/customer")
public class CustomerController {

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public Customer get(){
        return new Customer("Kishore",10);
    }

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String getHello(){
        return "Hello from customer service";
    }
}
