package com.kishore.services.cartservice;

import com.kishore.Customer;
import com.kishore.Item;
import com.kishore.services.cartservice.clients.CustomerService;
import com.kishore.services.cartservice.clients.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/cart")
public class CartController {

    @Autowired private CustomerService customerService;
    @Autowired private ItemService itemService;

    @RequestMapping(value = "/customer", method = RequestMethod.GET)
    public String getCustomer() {
        return customerService.getHello();
    }


    @RequestMapping(value = "/item", method = RequestMethod.GET)
    public String getItem(){
        return itemService.getHello();
    }

}
