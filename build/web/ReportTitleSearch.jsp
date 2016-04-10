
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sql.DbConnect"%>
<html>

<head>
  <title>Music Recommendation System</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
</head>

<body>
  <div id="main">
    <header>
	 
        <center><h3>Music Recommendation System</h3></center>
	    
	    	      <h3>The suggested songs are :</h3>
	    		
	  
    </header>

	<nav>
	  <div id="menubar">
        <ul id="nav">
          
          <li><a href="ourwork.html">Our Work</a></li>
          <li class="current"><a href="ReportTitleSearch.jsp">Title Search Status</a></li>
          
        </ul>
      </div><!--close menubar-->	
	</nav>
    
	<div id="site_content">		

      
	
	  <div id="content">
        <div class="content_item">
            
            <table align="center" BORDER=1>
<tr>
<th>Genre</th>
<th>Track ID</th>
<th>Artist Name</th>

<th>Track Title</th>
<th>Euclidiean Distance</th>


</tr>
            <%
             String track_id = "";
                            String artist_name= "";
                            String title = "";
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
                             
                             double song_hotttnesss = 0.0;
                 
            try {
                
               String strResult= session.getAttribute("result").toString();
              String strCentroid=session.getAttribute("centroid").toString();
              String strdiff=session.getAttribute("diff").toString();
              double centroid=Double.parseDouble(strCentroid);
              double diff=Double.parseDouble(strdiff);
              %>
              <h1>Best Matches Found  </h1>
              

              
              <%
          
              out.println(strResult);
DbConnect objdb=new DbConnect();

Connection con1=objdb.getConn_songs();



        String sMakeSelect = "SELECT * FROM songs";
             Statement stmt = con1.createStatement();
              ResultSet rs = stmt.executeQuery(sMakeSelect);
             Double TempoMeanVal=0.0;
              
               while(rs.next())
                        {
                            String genre = rs.getString("genre");
                             track_id = rs.getString("track_id");
                            artist_name= rs.getString("artist_name");
                             title = rs.getString("title");
                             loudness = rs.getDouble("loudness");
                             
                          song_hotttnesss = -0.0103744*loudness + 0.284561; 
                          System.out.println("song_hotttnesss : "+ song_hotttnesss);
                             
                             tempo = rs.getDouble("tempo");
                            System.out.println("Mean value : "+ (centroid-tempo));
                            
                            TempoMeanVal=(centroid-tempo)-diff;
                            // SumTempo+=tempo;
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
                       
if(TempoMeanVal <0.2 && TempoMeanVal>-0.2  && song_hotttnesss< 0.4)
{
    System.out.println(" genre : "+genre+" track_id : "+track_id+" loudness : "+loudness+" tempo  : "+tempo +" avg_timbre1 : "+avg_timbre1+" avg_timbre12 : "+avg_timbre12+" var_timbre1: "+var_timbre1+" var_timbre12 : "+var_timbre12);

                                                      %>
                            <tr>
<td><%=genre %></td>
<td><%=track_id %></td>
<td><%=artist_name %></td>
<td><%=title %></td>
<td><%=""+TempoMeanVal %></td>

</tr>
                            <%
}
         }
              }
 catch(SQLException ex) 
                 {
     System.out.println(ex.getMessage());
 }
            
            %>
           </table>
          <h1>Result Generated</h1>
		               <!--close content_container-->
	    </div><!--close content_item-->
      </div><!--close content-->   
	</div><!--close site_content-->  	
  </div><!--close main-->
  
    
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>  
  
</body>
</html>
