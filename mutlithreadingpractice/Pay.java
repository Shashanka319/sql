package com.corejavaproject.mutlithreadingpractice;

import lombok.Getter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

import java.util.concurrent.Callable;
@Getter
@ToString
@Log4j2
public class Pay implements Callable<Pay> {
    private String id;
    private String creditor;
    private  String debitor;
    private double amount;

    public Pay(String id, String creditor, String debitor, double amount) {
        this.id = id;
        this.creditor = creditor;
        this.debitor = debitor;
        this.amount = amount;
    }

    @Override
    public Pay call() throws Exception {
        log.info("Calling Payment with id " + id + " with creditor " + creditor);
        Thread.sleep(5000);
        log.info("Terminating Payment with id " + id + " with creditor " + creditor);
        return this;
    }
}
