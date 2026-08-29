package com.corejavaproject.map;


import lombok.ToString;
import lombok.extern.log4j.Log4j2;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
@Log4j2

public class CustomerRunner {
    public static void main(String[] args) {
        Map<Customer,Account> map= new TreeMap<>();
        Customer customer = new Customer();
        customer.setName("Shashank");
        customer.setAge(23);
        customer.setMobileNo(97438733482L);
        customer.setAddress("Hodige");

        Customer customer1 = new Customer();
        customer1.setName("Sharath");
        customer1.setAge(22);
        customer1.setMobileNo(9743873982L);
        customer1.setAddress("Hodigere");

        Account account = new Account();
        account.setAdharNo(508031391784L);
        account.setEmail("sharathshashank1986@gmail.com");
        account.setPassword("shar1986");
        account.setAccNo(12564343176543L);

        Account account1 = new Account();
        account1.setAdharNo(508031391784L);
        account1.setEmail("sharathshashank1986@gmail.com");
        account1.setPassword("shar1986");
        account1.setAccNo(12564343176543L);

        map.put(customer,account);
        map.put(customer1,account1);

        map.forEach((k,v)->log.info("key:{},value:{}",k,v));
    }


}
