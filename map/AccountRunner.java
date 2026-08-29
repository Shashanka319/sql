package com.corejavaproject.map;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

import java.util.HashMap;
import java.util.Map;
@Log4j2

public class AccountRunner {
    public static void main(String[] args) {
        Map<Customer,Account> map= new HashMap<Customer,Account>();
        Customer customer = new Customer();
        customer.setName("Shashank");
        customer.setAge(22);
        customer.setMobileNo(9743873982L);
        customer.setAddress("Hodigere");

        Account account = new Account();
        account.setAdharNo(508031391784L);
        account.setEmail("sharathshashank1986@gmail.com");
        account.setPassword("shar1986");
        account.setAccNo(12564343176543L);

        map.put(customer,account);

        log.info("Account Information Using Map");

        map.forEach((k,v)->log.info("key:{},value:{}",k,v));


    }
}
