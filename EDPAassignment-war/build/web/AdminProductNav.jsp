<%-- 
    Document   : AdminProductNav
    Created on : Oct 14, 2020, 10:12:02 PM
    Author     : Ee ren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <div class="flex">
            <a href="AdminProductAdd.jsp" style="text-decoration:none;"><input type="button" class="searchBtn" value="Add Item"/></a>
            <form action="AdminProduct" class="flex" method="POST">
                <input type="text" class="searchText" name="search"/>
                <input type="submit" class="searchBtn" value="Search by Name"/>
            </form>
        </div>