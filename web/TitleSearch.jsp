

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sql.DbConnect"%>
<%
String titles=request.getParameter("title");
Connection con1=null;
///=========================sql lite varible ====================================

String track_id = "";
                            String title = "";
                            String song_id = "";
                            String release = "";
                            String artist_id = "";
                            String artist_mbid = "";
                            String artist_name = "";
                            float duration = 0;
                            float artist_familiarity = 0;
                           float artist_hotttnesss = 0;
                            int year = 0;
                            
         //================mysql varible======================                   
            String track_ids = "";
                            String artist_names= "";
                            String titless = "";
                            double loudness = 0.0;
                            double tempo = 0.0;
                           int time_signature = 0;
                            int key = 0;
                             int mode = 0;
                            double durations = 0.0;
                            double avg_timbre1 = 0.0;
                           double avg_timbre2 = 0.0;
                            double avg_timbre3 = 0.0;
                             double avg_timbre4 = 0.0;
                              double avg_timbre5 = 0.0;
                               double avg_timbre6 = 0.0;
                                double avg_timbre7 =0.0;
                                 double avg_timbre8 = 0.0;
                                  double avg_timbre9 = 0.0;
                                   double avg_timbre10 = 0.0;
                                    double avg_timbre11 = 0.0;
                                     double avg_timbre12 = 0.0;
                             double var_timbre1 = 0.0;  
                             double var_timbre2 = 0.0;
                             double var_timbre3 = 0.0;
                             double var_timbre4 = 0.0;
                             double var_timbre5 = 0.0;
                             double var_timbre6 =0.0;
                             double var_timbre7 = 0.0;
                             double var_timbre8 = 0.0;
                             double var_timbre9 = 0.0;
                             double var_timbre10 = 0.0;
                             double var_timbre11 = 0.0;
                             double var_timbre12 = 0.0;
                 
double var_tempo = 0.0;
 try {
DbConnect objdb=new DbConnect();

Connection con=objdb.getConn_songs();

Connection litecon=objdb.getConn_track_metadata();
//========================================sql lite =========================================

 String sMakeSelect = "SELECT * FROM songs where title=?";
            // Statement stmts = litecon.createStatement();
             // ResultSet rs1 = stmts.executeQuery(sMakeSelect);
             PreparedStatement pst=litecon.prepareStatement("select * from songs where title=?");
	pst.setString(1,titles);
	//out.println(pst1);
	ResultSet rs1=pst.executeQuery(); 
               while(rs1.next())
                        {
                             track_id = rs1.getString("track_id");
                             title = rs1.getString("title");
                            song_id = rs1.getString("song_id");
                            release = rs1.getString("release");
                           artist_id = rs1.getString("artist_id");
                             artist_mbid = rs1.getString("artist_mbid");
                            artist_name = rs1.getString("artist_name");
                            duration = rs1.getFloat("duration");
                            artist_familiarity = rs1.getFloat("artist_familiarity");
                            artist_hotttnesss = rs1.getFloat("artist_hotttnesss");
                             year = rs1.getInt("year");
                   
                                                                                            
                            System.out.println("track_id : "+track_id+" title : "+title+" song_id  : "+song_id +" release : "+release+" artist_id : "+artist_id+" artist_mbid: "+artist_mbid+" artist_name : "+artist_name+" duration : "+duration+" artist_familiarity : "+artist_familiarity+" artist_hotttnesss : "+artist_hotttnesss+"year : "+year);
                        }

//------------------------------------mysql=---------------------------------------------

PreparedStatement pst1=con.prepareStatement("select * from songs where title=?");
	pst1.setString(1,titles);
	//out.println(pst1);
	ResultSet rs=pst1.executeQuery();
	//out.println(rs);
	int l=0,count=0;
	if(rs.next())
	{
	String genre = rs.getString("genre");
                             track_ids = rs.getString("track_id");
                            artist_names= rs.getString("artist_name");
                             titless = rs.getString("title");
                             loudness = rs.getDouble("loudness");
                            tempo = rs.getDouble("tempo");
                            var_tempo= tempo;
                          time_signature = rs.getInt("time_signature");
                           key = rs.getInt("key");
                             mode = rs.getInt("mode");
                             durations = rs.getDouble("duration");
                           avg_timbre1 = rs.getDouble("avg_timbre1");
                            avg_timbre2 = rs.getDouble("avg_timbre2");
                           avg_timbre3 = rs.getDouble("avg_timbre3");
                              avg_timbre4 = rs.getDouble("avg_timbre4");
                              avg_timbre5 = rs.getDouble("avg_timbre5");
                                avg_timbre6 = rs.getDouble("avg_timbre6");
                                 avg_timbre7 = rs.getDouble("avg_timbre7");
                                 avg_timbre8 = rs.getDouble("avg_timbre8");
                                   avg_timbre9 = rs.getDouble("avg_timbre9");
                                    avg_timbre10 = rs.getDouble("avg_timbre10");
                                  avg_timbre11 = rs.getDouble("avg_timbre11");
                                     avg_timbre12 = rs.getDouble("avg_timbre12");
                              var_timbre1 = rs.getDouble("var_timbre1");  
                              var_timbre2 = rs.getDouble("var_timbre2");
                              var_timbre3 = rs.getDouble("var_timbre3");
                            var_timbre4 = rs.getDouble("var_timbre4");
                              var_timbre5 = rs.getDouble("var_timbre5");
                             var_timbre6 = rs.getDouble("var_timbre6");
                             var_timbre7 = rs.getDouble("var_timbre7");
                             var_timbre8 = rs.getDouble("var_timbre8");
                              var_timbre9 = rs.getDouble("var_timbre9");
                              var_timbre10 = rs.getDouble("var_timbre10");
                              var_timbre11 = rs.getDouble("var_timbre11");
                              var_timbre12 = rs.getDouble("var_timbre12");
                     count++;  

  String strTitleResult=genre+" ~ "+track_id+" ~ "+artist_name+" ~ "+title;
session.setAttribute( "result", strTitleResult );                                             
     System.out.println("count : "+count+" genre : "+genre+" track_id : "+track_id+" loudness : "+loudness+" tempo  : "+tempo +" avg_timbre1 : "+avg_timbre1+" avg_timbre12 : "+avg_timbre12+" var_timbre1: "+var_timbre1+" var_timbre12 : "+var_timbre12);
      
         }
        
   Double DataPoint=artist_familiarity+key+time_signature+tempo+durations;
        
       //  Double DataPoint=artist_familiarity*key*time_signature*tempo*durations;
        System.out.println("Data : "+DataPoint);
        
        System.out.println("artist_hotttnesss  : "+artist_hotttnesss );
        
        
        
        
        
        
        
        
        
               }
 catch(SQLException ex) 
                 {
     System.out.println(ex.getMessage());
 }
                             
   
        try {
            
        
         
            DbConnect objdb=new DbConnect();
            con1=objdb.getConn_songs();
            
             String  query= "SELECT count(*), SUM(tempo) as total FROM songs";
          Statement stmt1 = con1.createStatement();
              ResultSet rs1 = stmt1.executeQuery(query);
               int count=0;
              Double SumTempo=0.0;
               int countplus=0;
              while(rs1.next())
                        {
                 countplus= rs1.getInt(1);
                  SumTempo=rs1.getDouble(2);
                System.out.println("countplus : "+countplus+" SumTempo : "+SumTempo);
                        }
            System.out.println("centroid : "+SumTempo/countplus);
            
            double CentroidTempoVal=SumTempo/countplus;
                   double diffmatch=CentroidTempoVal-var_tempo;
                   
                    System.out.println("diffmatch : "+diffmatch);
            session.setAttribute( "centroid", CentroidTempoVal );
         session.setAttribute( "diff", diffmatch );
            
           
             
        } catch (SQLException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
        }           
                             
                             
RequestDispatcher red=request.getRequestDispatcher("./ReportTitleSearch.jsp");
red.forward(request,response);
%>