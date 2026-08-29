package com.corejavaproject.mutlithreadingpractice;

import lombok.Getter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

import java.util.concurrent.Callable;
@Getter
@ToString
@Log4j2
public class Product implements Callable<Product> {
    private int id;
    private String name;
    private double price;

    public Product(int id, String name, double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }
    @Override
    public Product call() throws Exception {
        log.info("Start the Process of Product"+this.id);
        Thread.sleep(3000);
        log.info("Terminate  the Process of Product"+this.id);
        return this;
    }
}
