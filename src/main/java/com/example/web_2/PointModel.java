//package com.example.web_2;
//
//import java.util.Objects;
//
//public class PointModel {
//    double x;
//    double y;
//    double r;
//    boolean hit;
//    public PointModel(double x, double y, double r, boolean hit){
//        this.r = r;
//        this.x = x;
//        this.y = y;
//        this.hit = hit;
//    }
//
//    public double getR() {
//        return r;
//    }
//
//    public double getY() {
//        return y;
//    }
//
//    public double getX() {
//        return x;
//    }
//    public boolean getHit(){
//        return hit;
//    }
//
//    @Override
//    public String toString() {
//        return "PointModel{" +
//                "x=" + x +
//                ", y=" + y +
//                ", r=" + r +
//                ", hit=" + hit +
//                '}';
//    }
//
//    @Override
//    public boolean equals(Object o) {
//        if (this == o) return true;
//        if (o == null || getClass() != o.getClass()) return false;
//        PointModel that = (PointModel) o;
//        return Double.compare(x, that.x) == 0 && Double.compare(y, that.y) == 0 && Double.compare(r, that.r) == 0 && hit == that.hit;
//    }
//
//    @Override
//    public int hashCode() {
//        return Objects.hash(x, y, r, hit);
//    }
//}
