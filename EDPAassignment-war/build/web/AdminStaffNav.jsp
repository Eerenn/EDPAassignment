<%-- 
    Document   : AdminStaffNav
    Created on : Oct 13, 2020, 5:40:13 PM
    Author     : Ee ren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <div class="flex">
            <a href="AdminStaffAdd.jsp" style="text-decoration:none;"><input type="button" class="searchBtn" value="Add Staff"/></a>
            <form action="AdminStaff" class="flex" method="POST">
                <input type="text" class="searchText" name="search"/>
                <input type="submit" class="searchBtn" value="Search by Name"/>
            </form>
        </div>