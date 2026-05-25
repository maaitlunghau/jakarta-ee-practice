<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management - i18n</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body class="bg-slate-100 p-8">

    <%-- 1. SetLocale --%>
    <c:if test="${not empty param.language}">
        <c:choose>
            <c:when test="${param.language == 'vi'}">
                <fmt:setLocale value="vi_VN" scope="session"/>
            </c:when>
            <c:otherwise>
                <fmt:setLocale value="en_US" scope="session"/>
            </c:otherwise>
        </c:choose>
    </c:if>

    <%--2. SetBundle--%>
    <fmt:setBundle basename="com.fpt.language.course" var="bundle" />

    <div class="max-w-4xl mx-auto space-y-6">
        <%-- 3. Giao diện đổi ngôn ngữ --%>
        <div class="bg-white p-6 rounded-lg shadow-sm border border-slate-200">
            <form id="langForm" action="Localization.jsp" method="get" class="flex items-center gap-6">
                <h3 class="font-bold text-slate-700">
                    <fmt:message key="panel" bundle="${bundle}" />:
                </h3>
                
                <label class="flex items-center gap-2 cursor-pointer">
                    <input type="radio" name="language" value="en" 
                           ${empty sessionScope['jakarta.servlet.jsp.jstl.fmt.locale.session'] or sessionScope['jakarta.servlet.jsp.jstl.fmt.locale.session'] == 'en_US' ? 'checked' : ''}
                           onchange="this.form.submit();" class="w-4 h-4 text-blue-600">
                    <span class="text-slate-600"><fmt:message key="language.en" bundle="${bundle}" /></span>
                </label>

                <label class="flex items-center gap-2 cursor-pointer">
                    <input type="radio" name="language" value="vi" 
                           ${sessionScope['jakarta.servlet.jsp.jstl.fmt.locale.session'] == 'vi_VN' ? 'checked' : ''}
                           onchange="this.form.submit();" class="w-4 h-4 text-blue-600">
                    <span class="text-slate-600"><fmt:message key="language.vi" bundle="${bundle}" /></span>
                </label>
            </form>
        </div>

        <%-- 4. Form chính --%>
        <div class="bg-white p-8 rounded-xl shadow-lg border border-slate-200">
            <h2 class="text-2xl font-bold text-slate-800 mb-6 border-b pb-4">
                <fmt:message key="course.title" bundle="${bundle}" />
            </h2>
            
            <form action="#" method="post" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-slate-700 mb-1">
                        <fmt:message key="course.name" bundle="${bundle}" />
                    </label>
                    <input type="text" name="courseName" class="w-full p-2 border border-slate-300 rounded-md focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1">
                            <fmt:message key="course.price" bundle="${bundle}" />
                        </label>
                        <input type="number" name="price" class="w-full p-2 border border-slate-300 rounded-md focus:ring-2 focus:ring-blue-500 outline-none">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1">
                            <fmt:message key="course.duration" bundle="${bundle}" />
                        </label>
                        <input type="number" name="duration" class="w-full p-2 border border-slate-300 rounded-md focus:ring-2 focus:ring-blue-500 outline-none">
                    </div>
                </div>

                <div class="flex gap-4 pt-4">
                    <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded-md hover:bg-blue-700 font-semibold transition">
                        <fmt:message key="course.submit" bundle="${bundle}" />
                    </button>
                    <button type="reset" class="bg-slate-200 text-slate-700 px-6 py-2 rounded-md hover:bg-slate-300 font-semibold transition">
                        <fmt:message key="course.cancel" bundle="${bundle}" />
                    </button>
                </div>
            </form>
        </div>

        <div class="text-center pt-4">
            <a href="index.jsp" class="text-blue-600 hover:underline">← Back to Dashboard</a>
        </div>
    </div>

</body>
</html>
