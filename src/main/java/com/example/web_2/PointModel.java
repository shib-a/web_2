package com.example.web_2;

import java.util.HashMap;
import java.util.Objects;

public class PointModel {
    double x;
    double y;
    double r;
    Double raw_x;
    Double raw_y;
    boolean hit;
    public PointModel(double x, double y, double r, boolean hit, Double raw_x, Double raw_y){
        this.r = r;
        this.x = x;
        this.y = y;
        this.raw_x=raw_x;
        this.raw_y = raw_y;
        this.hit = hit;
    }

    public double getR() {
        return r;
    }

    public Double getRaw_x() {
        return raw_x;
    }

    public Double getRaw_y() {
        return raw_y;
    }

    public double getY() {
        return y;
    }

    public double getX() {
        return x;
    }
    public boolean getHit(){
        return hit;
    }
    public HashMap<String, Double> toDumbAssCoords(){
        var svgX = (x*(140/r));
        var svgY = -(y)*(140/r);
        var hm = new HashMap<String, Double>();
        hm.put("x", svgX);
        hm.put("y",svgY);
        System.out.println(hm.get("x")+" "+ hm.get("y"));
        return hm;
    }

    @Override
    public String toString() {
        return "PointModel{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                ", hit=" + hit +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PointModel that = (PointModel) o;
        return Double.compare(x, that.x) == 0 && Double.compare(y, that.y) == 0 && Double.compare(r, that.r) == 0 && hit == that.hit;
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y, r, hit);
    }
}
