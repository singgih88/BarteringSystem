<%@page import="user.BarterPostUtility" %>
<%@page import="user.UserUtility" %>
<%@page import="user.TradeUtility" %>
<%@page import="beans.TradePojo" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
	BarterPostUtility utilObj = new BarterPostUtility();
	UserUtility userObj = new  UserUtility();
	TradeUtility  tradeObj = new TradeUtility();
	String sessionEmail = null;
	
	List<TradePojo> currentTrades = null;
	List<TradePojo> tradeRequestReceived = new ArrayList<TradePojo>();
	List<TradePojo> tradeRequestSent = new ArrayList<TradePojo>();
	List<TradePojo> tradeRequestApproved = new ArrayList<TradePojo>();
	if(request.getSession().getAttribute("email")!=null){
		sessionEmail=(String)session.getAttribute("email");
		tradeRequestSent = tradeObj.fetchCurrentRequestSent(sessionEmail);
		tradeRequestReceived = tradeObj.fetchCurrentRequestReceived(sessionEmail);
		tradeRequestApproved = tradeObj.fetchCurrentTradeApproved(sessionEmail);
		/** int userId = userObj.fetchUserIdFromEmail(sessionEmail);
		for(TradePojo pojo : currentTrades){
			if(userId==pojo.getPrimaryReqId())
				tradeRequestSent.add(pojo);
			else
				tradeRequestReceived.add(pojo);
		} */
		
	}else{
		System.out.print("User not logged in");
	}
	
	
	
	%>
<div class="table-responsive">
 <h4>Barter Request Received</h4>          
  <table class="table">
    <thead>
      <tr>
      	<th>Trade #</th>
        <th>Status Time</th>
        <th>Bartering Requested Post#</th>
        <th>Bartering Offered Post#</th>
        <th>Co Trader Name</th>
        <th>Co Trader Contact</th>
        <th>Co Trader Rating</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <%
      
      for (TradePojo trade : tradeRequestReceived){
      
      %>
      
      <tr>
        <td><%=trade.getTradeId() %></td>

        <%
        
       DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
 	   //get current date time with Date()
 	   Date date = trade.getTradeStatusTime();
 	   String time = dateFormat.format(date);
 	 
        %>
        <td><%=time %></td>
        <td><%=trade.getSecReqId() %></td>
        <td><%=trade.getPrimaryReqId() %></td>
         <%
        
        int primUserId = utilObj.fetchUserIdFromReqId(trade.getPrimaryReqId());
        String name =  userObj.fetchNamefromUserId(primUserId);
        %>
        <td><%=name %></td>
        <%
        String contact =  userObj.fetchContactfromUserId(primUserId);
        %>
        <td><%=contact %></td>
        <td>
       	 <div class="ratings">
    	    <%
        		for (int i=1;i<=trade.getSecUserRating();i++){ 
        	%>
              <span class="glyphicon glyphicon-star"></span>
         	<% } %>
         </div>
        </td>
        
        <td>
        <button id="btn-signup" type="submit" class="btn btn-info"><i class="icon-hand-right"></i>Approve Request</button>
        </td>
      </tr>
       <%
        
        }
        
        %>
      
    </tbody>
  </table>
  </div>
  
  
  <!--  Trade Request Sent Table -->
  <div class="table-responsive">          
   <h4>Barter Request Sent</h4>
   <table class="table">
    <thead>
      <tr>
      	<th>Trade #</th>
        
        <th>Status Time</th>
        <th>Bartering Requested Post#</th>
        <th>Bartering Offered Post#</th>
        <th>Co Trader Rating</th>
      </tr>
    </thead>
    <tbody>
      <%
      
      for (TradePojo trade : tradeRequestSent){
      
      %>
      
      <tr>
        <td><%=trade.getTradeId() %></td>
        
        <%
        
       DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
 	   //get current date time with Date()
 	   Date date = trade.getTradeStatusTime();
 	   String time = dateFormat.format(date);
 	 
        %>
        <td><%=time %></td>
        <td><%=trade.getSecReqId() %></td>
        <td><%=trade.getPrimaryReqId() %></td>
        
        <td>
       	 <div class="ratings">
    	    <%
        		for (int i=1;i<=trade.getSecUserRating();i++){ 
        	%>
              <span class="glyphicon glyphicon-star"></span>
         	<% } %>
         </div>
        </td>
      </tr>
       <%
        
        }
        
        %>
      
    </tbody>
  </table>
  
   <!--  Trade Approved Table -->
  <div class="table-responsive">  
  <h4>Barter Request Approved</h4>        
   <table class="table">
    <thead>
      <tr>
      	<th>Trade #</th>
        
        <th>Status Time</th>
        <th>Bartering Requested Post#</th>
        <th>Bartering Offered Post#</th>
        <th>Co Trader Name</th>
        <th>Co Trader Contact</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <%
      
      for (TradePojo trade : tradeRequestApproved){
      
      %>
      
      <tr>
        <td><%=trade.getTradeId() %></td>
        
        <%
        
       DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
 	   //get current date time with Date()
 	   Date date = trade.getTradeStatusTime();
 	   String time = dateFormat.format(date);
 	 
        %>
        <td><%=time %></td>
        <td><%=trade.getSecReqId() %></td>
        <td><%=trade.getPrimaryReqId() %></td>
         <%
         String name = null;
         int tradeId = 0;
         int loggedInUserId = userObj.fetchUserIdFromEmail(sessionEmail);
         if(loggedInUserId==trade.getPrimaryTraderUserId())
        	 tradeId = trade.getSecReqId();
         else
        	 tradeId = trade.getPrimaryReqId();
         int userId = utilObj.fetchUserIdFromReqId(tradeId);
		 name =  userObj.fetchNamefromUserId(userId);
        %>
        <td><%=name %></td>
        <%
        String contact = null;
        contact =  userObj.fetchContactfromUserId(userId);
        %>
        <td><%=contact %></td>
       <td>
        <button id="btn-signup" type="submit" class="btn btn-info"><i class="icon-hand-right"></i>Barter Completed</button>
        </td>
      </tr>
       <%
        
        }
        
        %>
      
    </tbody>
  </table>
  </div>