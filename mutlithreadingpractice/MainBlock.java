package com.corejavaproject.mutlithreadingpractice;

public class MainBlock {
    public static void main(String[] args) {
        SynchronizationBlock sb = new SynchronizationBlock();
        sb.objLevelLock();
        sb.classLevelLock();
        Thread t = new Thread(sb);
        t.start();

        SynchronizationBlock sb1 = new SynchronizationBlock();
        sb1.objLevelLock();
        sb1.classLevelLock();
        Thread t1 = new Thread(sb1);
        t1.start();

        SynchronizationBlock sb2 = new SynchronizationBlock();
        sb2.objLevelLock();
        sb2.classLevelLock();
        Thread t2 = new Thread(sb2);
        t2.start();



    }
}
