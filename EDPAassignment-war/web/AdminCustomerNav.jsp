<%-- 
    Document   : AdminCustomerNav
    Created on : Oct 14, 2020, 11:09:52 AM
    Author     : Ee ren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <div class="flex">
            <form action="AdminCustomer" class="flex" method="POST">
                <input type="text" class="searchText" name="search"/>
                <input type="submit" class="searchBtn" value="Search by Name"/>
            </form>
        </div>