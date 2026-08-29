package com.xworkx.methodOverride.Bank;

public class SBIRunner {
    public static void main(String[] args) {
        SBI sbi=new SBI();
        sbi.getInterest();

        Bank sbi1=new Bank();
        sbi1.getInterest();

        Bank sbi2=new SBI();
        sbi2.getInterest();
    }
}
