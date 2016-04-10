/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kMeans;

public class DistanceMeasure {
   
    
    private static double distance(double[] pointA, double [] pointB){
         double distance = 0.0;
         for (int i = 0; i < pointA.length; i++) {
            double d = pointA[i] - pointB[i];
             distance += d * d;
         }
        return Math.sqrt(distance);
     }
    
    private static double Centroid()
    {
       double  cx = 0;
        double    cy = 0;
  return cx;
    }
}
