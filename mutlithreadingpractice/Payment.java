package com.corejavaproject.mutlithreadingpractice;

import lombok.Getter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

import java.util.concurrent.Callable;
@Getter
@ToString
@Log4j2
public class Payment implements Callable<Payment> {
    private String payId;
    private String creditor;
    private String debtor;
    private double amount;

    public Payment(String payId, String creditor, String debtor, double amount) {
        this.payId = payId;
        this.creditor = creditor;
        this.debtor = debtor;
        this.amount = amount;
    }

    @Override
    public Payment call() throws Exception {
        log.info("Payment Process is Started");
        Thread.sleep(5000);
        log.info("Payment Process Completed");
        return this;
    }
}
