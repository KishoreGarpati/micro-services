package com.kishore.services.itemservice;

import com.kishore.Item;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/item")
public class ItemController {

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public Item get(){
        return new Item("iPhone", 20);
    }

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String getHello(){
        return "Hello from item service";
    }
}
