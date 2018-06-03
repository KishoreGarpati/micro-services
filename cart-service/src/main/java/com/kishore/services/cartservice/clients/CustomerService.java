package com.kishore.services.cartservice.clients;

import com.kishore.Customer;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Service
@FeignClient(value = "CUSTOMER-SERVICE")
public interface CustomerService {

    @RequestMapping(value = "/customer/hello",method = RequestMethod.GET)
    String getHello();
}
