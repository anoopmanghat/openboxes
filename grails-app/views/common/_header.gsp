<%@ page import="org.pih.warehouse.core.RoleType" %>
<!-- Block which includes the logo and login banner -->
<div id="header" class="yui-b">
	<div class="yui-gf">				
		<div id="banner">
		    <div id="bannerLeft" class="yui-u first" >
				<div class="logo" >					
					<g:if test="${session?.warehouse?.logo }">
						<a class="home" href="${createLink(uri: '/dashboard/index')}">	
							<img class="logo" src="${createLink(controller:'location', action:'viewLogo', id:session?.warehouse?.id)}" class="middle" />
						</a>						
					</g:if>
					<g:else>
					    <a class="home" href="${createLink(uri: '/dashboard/index')}">						    	
				    		<img src="${createLinkTo(dir:'images/icons/',file:'logo24.png')}" title="${warehouse.message(code:'default.tagline.label') }" class="top"/>
			    			<span class="top">
								<warehouse:message code="default.openboxes.label"/>
							</span>
					    </a>
					</g:else>
				</div>
		    </div>
		    
		    <div id="bannerRight" class="yui-u">
		    	<div id="loggedIn" style="vertical-align:middle;" >
					<ul>
					    <g:if test="${session.user}">
					    	<g:if test="${session?.warehouse}">
								<li>
									<g:link class="middle" controller="user" action="show" id="${session.user.id}">
										<img src="${resource(dir: 'images/icons/silk', file: 'user.png')}" class="middle"/>
										<span class="middle">${session?.user?.name}</span> 
									</g:link>
								</li>
							</g:if>
							<g:else>
								<li>								
									<img src="${resource(dir: 'images/icons/silk', file: 'user.png')}" class="middle"/>
									${session?.user?.name} 
								</li>
							</g:else>
							
							<li>
								<span class="action-menu" >
									<span class="action-btn middle">		
										<img src="${resource(dir: 'images/icons/silk', file: 'bullet_arrow_down.png')}" class="middle"/>
									</span>
									<ul class="actions" style="text-align:left;">
										<li class="action-menu-item">
											<g:link controller="user" action="show" id="${session.user.id }" style="color: #666;">												
												<warehouse:message code="myProfile.label" default="My profile"/>
											</g:link>
										</li>
										<%-- 
										<li class="action-menu-item">
											<g:link controller="inventory" action="browse" params="['resetSearch':'true']" style="color: #666;">												
												<warehouse:message code="inventory.browse.label"/>
											</g:link>
										</li>
										--%>
													
										<%-- 																	
										<li>
											<img src="${createLinkTo(dir: 'images/icons/silk', file: 'cart.png')}" style="vertical-align: middle" />
											<g:link controller="cart" action="list">Cart <span style="color: orange; font-weight: bold;">${session?.cart ? session?.cart?.items?.size() : '0'}</span></g:link>
											
										</li>
										--%>
										<g:if test="${session?.warehouse}">
											<%-- 
											<li class="action-menu-item">
												<g:link  controller="dashboard" action="index" style="color: #666;">
													<warehouse:message code="dashboard.label"/>
												</g:link>	
											</li>
											--%>																	
											<li class="action-menu-item">
												<a href="javascript:void(0);" class="warehouse-switch" style="color: #666">
													Change location
												</a>
												<span id="warehouseMenu" title="${warehouse.message(code:'warehouse.chooseLocationToManage.message')}" style="display: none; padding: 10px;">
													<g:isUserNotInRole roles="[RoleType.ROLE_ADMIN]">
														<div class="error">
															${warehouse.message(code:'auth.needAdminRoleToChangeLocation.message')}
														</div>
													</g:isUserNotInRole>
													<g:isUserInRole roles="[RoleType.ROLE_ADMIN]">
														<div style="height: 300px; overflow: auto;">
															<g:set var="nullLocationGroup" value="${session.loginLocationsMap.remove(null) }"/> 
															<g:each var="entry" in="${session.loginLocationsMap}" status="i">																
																<h3>${entry.key }</h3>
																<div class="button-group">
																<g:each var="warehouse" in="${entry.value }">
																	<g:set var="targetUri" value="${(request.forwardURI - request.contextPath) + '?' + (request.queryString?:'') }"/>
																	<a class="button icon pin" href='${createLink(controller: "dashboard", action:"chooseLocation", id: warehouse.id, params:['targetUri':targetUri])}'>
																		${warehouse.name}
																	</a> 
																</g:each>
																</div>
															</g:each>		
															
															<h3>${warehouse.message(code: 'default.others.label', default: 'Others')}</h3>
															<div class="button-group">											
																<g:each var="warehouse" in="${nullLocationGroup }" status="status">
																	<a id="warehouse-${warehouse.id}-link" href='${createLink(action:"chooseLocation", id: warehouse.id)}' class="button icon pin">
																		${warehouse.name}
																	</a>
																</g:each>
															</div>															
																														
															<%-- 
															<div class="prop">
																<g:checkBox name="rememberLastLocation" value="${session.user.rememberLastLocation}"/> 
																Remember my location and log me in automatically.
																
																${session.user.rememberLastLocation}
																${session.user.warehouse }
															</div>
															--%>
															<g:unless test="${session.loginLocations }">
																<div style="background-color: black; color: white;" class="warehouse button">
																	<warehouse:message code="dashboard.noWarehouse.message"/>
																</div>
															</g:unless>
														</div>												
													</g:isUserInRole>
												</span>
											</li>
										</g:if>
																					
										<li class="action-menu-item">
											<g:link class="list" controller="auth" action="logout" style="color:#666"><warehouse:message code="default.logout.label"/></g:link>
										</li>					
											
										<!-- 
										 <li><g:link class="list" controller="user" action="preferences"><warehouse:message code="default.preferences.label"  default="Preferences"/></g:link></li>
										 -->										 
										<!-- 
										 <li><input type="text" value="search" name="q" style="color: #aaa; font-weight: bold;" disabled=disabled /></li>
										 -->
								    </g:if>
								   
								</ul>
							</span>
						</li>
						<li>
							<g:globalSearch id="globalSearch" cssClass="globalSearch" width="300" name="searchTerms" jsonUrl="${request.contextPath }/json/globalSearch"></g:globalSearch>						
						</li>	
							
						
					</ul>
				</div>					
		    </div>
		</div>
	</div>
</div>
		    