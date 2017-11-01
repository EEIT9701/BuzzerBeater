<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <%@ page import="java.util.*"%>
            <%@ page import="eeit.players.model.*"%>
           <%@ page import="eeit.personaldata.model.*"%>
           <%@ page import="eeit.games.model.*"%>
<% Integer playerID = new Integer(request.getParameter("playerID"));
    PlayerService PlayerSvc = new PlayerService();
    PlayersVO playerVO = PlayerSvc.getOnePlayerID(playerID);
	pageContext.setAttribute("playerVO", playerVO); %>

<%-- <%
	PersonalDataService psvc = new PersonalDataService();
	List<PersonalDataVO> list = psvc.findByPlyerID2(playerID);
	pageContext.setAttribute("list1", list);
%> --%>

                    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                    <html>

                    <head>
                        <title>${playerVO.playerName}</title>
                        <meta name="viewport" content="width=device-width, initial-scale=1">
                        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                        <jsp:include page="/header_css.jsp" />
                        <!--滑鼠移入，顯示表格(jquery設定"2-1")-->
                        <link href="<%=request.getContextPath() %>/css/jquery-ui-1.12.1.css" rel="stylesheet">
                        <style>
                            #imgPlayer {
                                width: 200px;
                                height: 300px;
                                margin: 0px 0px 30px 70px;
                            }

                            #team {
                                width: 300px;
                                height: 250px;
                                margin: 25px 100px 30px 0px;
                            }
                        </style>
                        <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
                    </head>

                    <body>

                        <jsp:include page="/header.jsp" />
                        <!--主文(開始)-->
                        <div class="container">
                            <div class="jumbotron">
                                <!-- 第二列(開始) -->
                                <!--****************-->
                                <div class="row">
                                    <!--第二列-左邊表格-格式_.col-md-4-->
                                    <div class="col-md-4">
                                        <div class="col-md-12">
                                            <img id="imgPlayer" src="data:image/jpeg;base64,${playerVO.photo}">
                                            <!--球員照片-->
                                        </div>
                                    </div>
                                    <!--第二列-中間表格-格式_ .col-md-4-->
                                    <div class="col-md-4">

                                        <div class="col-md-12">
                                            <h2>${playerVO.playerName}</h2>
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>球隊 |
                                                            <c:forEach var="team" items="${playerVO.teamCompositionSet}">${team.teamsVO.teamName}</c:forEach>
                                                        </td>
                                                        <td>生日 | ${playerVO.birthday}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>背號 | <c:forEach var="team" items="${playerVO.teamCompositionSet}">${team.playerNo}</c:forEach></td>
                                                        <td>國籍 | ${playerVO.nationality}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>身高 | ${playerVO.height}公分</td>
                                                        <td>體重 | ${playerVO.weights}公斤</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>平均得分</th>
                                                        <th>平均籃板</th>
                                                        <th>平均助攻</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                     <c:forEach var="personalDataVO" items="${list1}" >
                                                        <td><fmt:formatNumber type="number" value="${personalDataVO.points/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>
                                                        <td><fmt:formatNumber type="number" value="${personalDataVO.offReb/personalDataVO.gamesVO.gameID+personalDataVO.defReb/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>
                                                        <td><fmt:formatNumber type="number" value="${personalDataVO.assist/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>
                                                        </c:forEach>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!--第二列-右邊表格-格式_.col-md-4-->
                                    <div class="col-md-4">

                                        <div class="col-md-12">
                                        <c:forEach var="team" items="${playerVO.teamCompositionSet}">
                                         <img id="team" src="data:image/png;base64,${team.teamsVO.teamBadge}">
                                            </c:forEach>
                                            <!--球員照片-->
                                        </div>
                                    </div>
                                </div>
                                <!--****************-->
                                <!-- 第二列(結束) -->
                                <!--****************-->
                                <div class="row">
                                    <!--第二列-左邊表格-格式_.col-md-4-->

                                    <div class="col-md-12">
                                        <!--滑鼠移入，顯示表格(開始)-->
                                        <div id="tabs">
                                            <ul>
                                                <li><a href="#tabs-1">本季數據</a></li>
                                                <li><a href="#tabs-2">近期比賽數據</a></li>
                                            </ul>
                                            <div id="tabs-1">
                                                <table class="table table-bordered">
                                                <table class="table table-bordered">
                                              <h5>本季平均</h5>  
                                                    <thead>
                                                        <tr>
                                                            <th>年度 </th>
                                                            <th>球隊</th>
                                                            <th>比賽</th>                                                   
                                                            <th>平均出場時間</th>
                                                            <th>投籃(%)</th>
                                                            <th>三分(%)</th>
                                                            <th>罰球(%)</th>
                                                            <th>進攻籃板</th>
                                                            <th>防守籃板 </th>
                                                            <th>平均籃板 </th>
                                                            <th>助功 </th>
                                                            <th>抄截 </th>
                                                            <th>阻攻 </th>
                                                            <th>失誤 </th>
                                                            <th>犯規 </th>
                                                            <th>得分</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                          <c:forEach var="personalDataVO" items="${list1}" >
								<tr align='center' valign='middle'>
                                    <td>2017-2018 例行賽</td>
									<td><a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${personalDataVO.teamsVO.teamID}">${personalDataVO.teamsVO.teamName}</a></td>
									<td>${personalDataVO.gamesVO.gameID}</td>
									
									<td><fmt:formatNumber type="number" value="${personalDataVO.gameTime/personalDataVO.gamesVO.gameID}" maxFractionDigits="0"/></td>
								
									<td><c:if test="${'0'==personalDataVO.twoPointShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.twoPointShot}">
									     <fmt:formatNumber type="number" value="${personalDataVO.twoPoint/personalDataVO.twoPointShot*100}" maxFractionDigits="1"/>
									    </c:if>
									</td>
									
									
									<td><c:if test="${'0'==personalDataVO.threePointShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.threePointShot}">
									      <fmt:formatNumber type="number" value="${personalDataVO.threePoint/personalDataVO.threePointShot*100}" maxFractionDigits="1"/>
									    </c:if>
									</td>
									
								
									<td><c:if test="${'0'==personalDataVO.fgShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.fgShot}">
									     <fmt:formatNumber type="number" value="${personalDataVO.fg/personalDataVO.fgShot*100}" maxFractionDigits="1"/>
									    </c:if>
									</td>
									
									<td><fmt:formatNumber type="number" value="${personalDataVO.offReb/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.defReb/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>
									
									<td><fmt:formatNumber type="number" value="${personalDataVO.offReb/personalDataVO.gamesVO.gameID+personalDataVO.defReb/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>
									
									<td><fmt:formatNumber type="number" value="${personalDataVO.assist/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.steal/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.blocks/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.turnover/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.personalFouls/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.points/personalDataVO.gamesVO.gameID}" maxFractionDigits="1"/></td>

								</tr>
							</c:forEach>
                                                    </tbody>
                                                    </table>  
                                                    <table class="table table-bordered">
                                                    <h5>本季總計</h5>  
                                                    <thead>
							<tr>

								                            <th>年度 </th>
                                                            <th>球隊</th>
                                                            <th>比賽</th>
                                                            <th>出場時間</th>
                                                     
                                                            <th>投籃(%)</th>
                                                            <th>三分(%)</th>
                                                            <th>罰球(%)</th>
                                                            <th>進攻籃板</th>
                                                            <th>防守籃板 </th>
                                                            <th>平均籃板 </th>
                                                            <th>助功 </th>
                                                            <th>抄截 </th>
                                                            <th>阻攻 </th>
                                                            <th>失誤 </th>
                                                            <th>犯規 </th>
                                                            <th>得分 </th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="personalDataVO" items="${list1}" begin="${personalDataVO.playersVO.playerID}" end="${personalDataVO.playersVO.playerID}">
								<tr align='center' valign='middle'>
                                    <td>2017-2018 例行賽</td>
									<td><a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${personalDataVO.teamsVO.teamID}">${personalDataVO.teamsVO.teamName}</a></td>
									<td>${personalDataVO.gamesVO.gameID}</td>
									<td>${personalDataVO.gameTime}</td>
																	
									<td><c:if test="${'0'==personalDataVO.twoPointShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.twoPointShot}">
									      <fmt:formatNumber type="number" value="${personalDataVO.twoPoint/personalDataVO.twoPointShot*100}" maxFractionDigits="1"/>
									    </c:if>
									</td>
									
																
									<td><c:if test="${'0'==personalDataVO.threePointShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.threePointShot}">
									     <fmt:formatNumber type="number" value="${personalDataVO.threePoint/personalDataVO.threePointShot*100}" maxFractionDigits="1"/>
									    </c:if>
									</td>
									
															
									<td><c:if test="${'0'==personalDataVO.fgShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.fgShot}">
									    <fmt:formatNumber type="number" value="${personalDataVO.fg/personalDataVO.fgShot*100}" maxFractionDigits="1"/>
									    </c:if>
									</td>
									<td>${personalDataVO.offReb}</td>
									<td>${personalDataVO.defReb}</td>								
									<td>${personalDataVO.offReb+personalDataVO.defReb}</td>
									<td>${personalDataVO.assist}</td>
									<td>${personalDataVO.steal}</td>
									<td>${personalDataVO.blocks}</td>
									<td>${personalDataVO.turnover}</td>
									<td>${personalDataVO.personalFouls}</td>
									<td>${personalDataVO.points}</td>
								</tr>
							</c:forEach>
						</tbody>
                                                </table>
     
                                                </table>
                                            </div>
                                            <div id="tabs-2">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>日期 </th>
                                                            <th>對手 </th>
                                                            <th>上場時間</th>
                                                            <th>投籃命中 </th>
                                                            <th>投籃出手 </th>
                                                            <th>投籃(%) </th>
                                                            <th>三分命中</th>
                                                            <th>三分出手 </th>
                                                            <th>三分(%)</th>
                                                            <th>罰球命中 </th>
                                                            <th>罰球出手 </th>
                                                            <th>罰球(%) </th>
                                                            <th>進攻籃板 </th>
                                                            <th>防守籃板 </th>
                                                            <th>助攻 </th>
                                                            <th>抄截 </th>
                                                            <th>阻攻 </th>
                                                            <th>失誤 </th>
                                                            <th>犯規</th>
                                                            <th>得分 </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="personalDataVO" items="${playersVO.personalDataSet}">
                                                        <tr>
                                                            <td>${personalDataVO.gamesVO.gameBeginDate}</td>
                                                            <td>
                                                               <c:if test="${personalDataVO.teamsVO.teamName==personalDataVO.gamesVO.teamAVO.teamName}">
							                                      ${personalDataVO.gamesVO.teamBVO.teamName}
									                           </c:if>
									                           <c:if test="${personalDataVO.teamsVO.teamName==personalDataVO.gamesVO.teamBVO.teamName}">
							                                      ${personalDataVO.gamesVO.teamAVO.teamName}
									                           </c:if>
									                        </td>
                                                            <td>${personalDataVO.gameTime}</td>
                                                            <td>${personalDataVO.twoPoint}</td>
                                                            <td>${personalDataVO.twoPointShot}</td>
                                                            <td>
                                                               <c:if test="${'0'==personalDataVO.twoPointShot}">
							                                    0
		                                                       </c:if> <c:if test="${'0' != personalDataVO.twoPointShot}">
														        	<fmt:formatNumber type="number"
															    	value="${personalDataVO.twoPoint/personalDataVO.twoPointShot*100}"
															    	maxFractionDigits="1" />
												        	   </c:if>
												        	</td>
                                                            <td>${personalDataVO.threePoint}</td>
                                                            <td>${personalDataVO.threePointShot}</td>
                                                            <td>
                                                               <c:if test="${'0'==personalDataVO.threePointShot}">
							                                   0
									                           </c:if> <c:if test="${'0' != personalDataVO.threePointShot}">
															       <fmt:formatNumber type="number"
																   value="${personalDataVO.threePoint/personalDataVO.threePointShot*100}"
																   maxFractionDigits="1" />
												               </c:if>
													        </td>
                                                            <td>${personalDataVO.fg}</td>
                                                            <td>${personalDataVO.fgShot}</td>
                                                            <td>
                                                               <c:if test="${'0'==personalDataVO.fgShot}">
							                                   0
									                           </c:if> <c:if test="${'0' != personalDataVO.fgShot}">
															       <fmt:formatNumber type="number"
																   value="${personalDataVO.fg/personalDataVO.fgShot*100}"
																   maxFractionDigits="1" />
												               </c:if>
												            </td>
													        <td>${personalDataVO.offReb}</td>
													        <td>${personalDataVO.defReb}</td>
													        <td>${personalDataVO.assist}</td>
													        <td>${personalDataVO.steal}</td>
													        <td>${personalDataVO.blocks}</td>
													        <td>${personalDataVO.turnover}</td>
													        <td>${personalDataVO.personalFouls}</td>
													        <td>${personalDataVO.points}</td>
													         
                                                        </tr>
                                                       </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>
                                        <!--滑鼠移入，顯示表格(結束)-->




                                    </div>
                                </div>
                                <jsp:include page="/footer.jsp" />

                            </div>
                        </div>
                        <!--主文(結束)-->

                        <jsp:include page="/footer_css.jsp" />
                        <!--滑鼠移入，顯示表格(jquery設定"2-2")-->
                        <script src="<%=request.getContextPath()%>/js/jquery-table-1.12.4.js"></script>
                        <script src="<%=request.getContextPath()%>/js/jquery-ui-table.js"></script>
                        <script>
                            $(function () {
                                $("#tabs").tabs({
                                    event: "mouseover"
                                });
                            });
                        </script>
                    </body>

                    </html>