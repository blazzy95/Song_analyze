/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sql;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TemaAndroid
 */
public class DbConnect {
    Connection conn=null;
    Connection conn1=null;
     public DbConnect() throws SQLException
    {
        
    }
    public Connection getConn_songs()
    {
      try {
            Class.forName("com.mysql.jdbc.Driver");
           
           conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/songs","root","1234");

            if (conn != null) {
                System.out.println("Connected to the database");
                DatabaseMetaData dm = (DatabaseMetaData) conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());
                //conn.close();
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return conn;
    }
     public Connection getConn_track_metadata()
    {
      try {
            Class.forName("org.sqlite.JDBC");
            String dbURL = "jdbc:sqlite:F:\\Final Song\\track_metadata.db";
             conn1 = DriverManager.getConnection(dbURL);
            if (conn1 != null) {
                System.out.println("Connected to the database");
                DatabaseMetaData dm = (DatabaseMetaData) conn1.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());
                //conn.close();
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return conn1;
    }
      public void getData_songsDb()
    {
        try {
            String sMakeSelect = "SELECT * FROM songs";
             Statement stmt = conn1.createStatement();
              ResultSet rs = stmt.executeQuery(sMakeSelect);
              
               while(rs.next())
                        {
                            String track_id = rs.getString("track_id");
                            String title = rs.getString("title");
                            String song_id = rs.getString("song_id");
                            String release = rs.getString("release");
                            String artist_id = rs.getString("artist_id");
                            String artist_mbid = rs.getString("artist_mbid");
                            String artist_name = rs.getString("artist_name");
                            float duration = rs.getFloat("duration");
                            float artist_familiarity = rs.getFloat("artist_familiarity");
                           float artist_hotttnesss = rs.getFloat("artist_hotttnesss");
                            int year = rs.getInt("year");
                            
                            System.out.println("track_id : "+track_id+" title : "+title+" song_id  : "+song_id +" release : "+release+" artist_id : "+artist_id+" artist_mbid: "+artist_mbid+" artist_name : "+artist_name+" duration : "+duration+" artist_familiarity : "+artist_familiarity+" artist_hotttnesss : "+artist_hotttnesss+"year : "+year);
                        }
             
        } catch (SQLException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
      public void getData_songs()
    {
        try {
            String sMakeSelect = "SELECT * FROM songs";
             Statement stmt = conn.createStatement();
              ResultSet rs = stmt.executeQuery(sMakeSelect);
              int count=0;
               while(rs.next())
                        {
                            String genre = rs.getString("genre");
                            String track_id = rs.getString("track_id");
                            String artist_name= rs.getString("artist_name");
                            String title = rs.getString("title");
                            double loudness = rs.getDouble("loudness");
                            double tempo = rs.getDouble("tempo");
                           int time_signature = rs.getInt("time_signature");
                            int key = rs.getInt("key");
                             int mode = rs.getInt("mode");
                            double duration = rs.getDouble("duration");
                            double avg_timbre1 = rs.getDouble("avg_timbre1");
                           double avg_timbre2 = rs.getDouble("avg_timbre2");
                            double avg_timbre3 = rs.getDouble("avg_timbre3");
                             double avg_timbre4 = rs.getDouble("avg_timbre4");
                              double avg_timbre5 = rs.getDouble("avg_timbre5");
                               double avg_timbre6 = rs.getDouble("avg_timbre6");
                                double avg_timbre7 = rs.getDouble("avg_timbre7");
                                 double avg_timbre8 = rs.getDouble("avg_timbre8");
                                  double avg_timbre9 = rs.getDouble("avg_timbre9");
                                   double avg_timbre10 = rs.getDouble("avg_timbre10");
                                    double avg_timbre11 = rs.getDouble("avg_timbre11");
                                     double avg_timbre12 = rs.getDouble("avg_timbre12");
                             double var_timbre1 = rs.getDouble("var_timbre1");  
                             double var_timbre2 = rs.getDouble("var_timbre2");
                             double var_timbre3 = rs.getDouble("var_timbre3");
                             double var_timbre4 = rs.getDouble("var_timbre4");
                             double var_timbre5 = rs.getDouble("var_timbre5");
                             double var_timbre6 = rs.getDouble("var_timbre6");
                             double var_timbre7 = rs.getDouble("var_timbre7");
                             double var_timbre8 = rs.getDouble("var_timbre8");
                             double var_timbre9 = rs.getDouble("var_timbre9");
                             double var_timbre10 = rs.getDouble("var_timbre10");
                             double var_timbre11 = rs.getDouble("var_timbre11");
                             double var_timbre12 = rs.getDouble("var_timbre12");
                     count++;       
     System.out.println("count : "+count+" genre : "+genre+" track_id : "+track_id+" loudness : "+loudness+" tempo  : "+tempo +" avg_timbre1 : "+avg_timbre1+" avg_timbre12 : "+avg_timbre12+" var_timbre1: "+var_timbre1+" var_timbre12 : "+var_timbre12);
                        }
             
        } catch (SQLException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static void main(String str[])
    {
        try {
            DbConnect obj=new DbConnect();
            
           obj.getConn_track_metadata();
            obj.getData_songsDb();
            
            
           obj.getConn_songs();
         obj.getData_songs();
            
        } catch (SQLException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
