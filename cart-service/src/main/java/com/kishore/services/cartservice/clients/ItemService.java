package com.kishore.services.cartservice.clients;

import com.kishore.Item;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Service
@FeignClient(value = "ITEM-SERVICE")
public interface ItemService {
    @RequestMapping(value = "/item/hello", method = RequestMethod.GET)
    String getHello();
}
