<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sach San Pham</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
<div class="container mx-auto px-4 py-8">
    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
        <h1 class="text-3xl font-bold text-gray-800">Quan Ly San Pham</h1>
        
        <div class="flex items-center gap-3 w-full md:w-auto">
            <!-- Nut Them Moi -->
            <a href="controller?action=create" 
               class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-4 py-2 rounded-lg transition text-sm whitespace-nowrap">
                + Them Moi
            </a>
            
            <!-- Form Tim Kiem -->
<%--            <form action="controller" method="get" class="flex w-full md:w-64">--%>
            <form action="${pageContext.request.contextPath}/controller" method="get" class="flex w-full md:w-64">
                <input type="hidden" name="action" value="search">
                <input type="text" name="txtSearch" placeholder="Tim ten san pham..."
                       class="w-full border border-gray-300 rounded-l-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                <button type="submit" class="bg-gray-800 hover:bg-black text-white px-3 py-2 rounded-r-lg transition">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                </button>
            </form>
        </div>
    </div>

    <!-- Bang San Pham -->
    <div class="bg-white rounded-xl shadow overflow-hidden">
        <table class="w-full text-left border-collapse">
            <thead>
                <tr class="bg-gray-50 border-b border-gray-200">
                    <th class="px-6 py-4 text-sm font-semibold text-gray-600">Hinh Anh</th>
                    <th class="px-6 py-4 text-sm font-semibold text-gray-600">Ma SP</th>
                    <th class="px-6 py-4 text-sm font-semibold text-gray-600">Ten San Pham</th>
                    <th class="px-6 py-4 text-sm font-semibold text-gray-600">Gia (VND)</th>
                    <th class="px-6 py-4 text-sm font-semibold text-gray-600 text-center">Thao Tac</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-100">
                <c:forEach var="p" items="${list}">
                    <tr class="hover:bg-gray-50 transition">
                        <td class="px-6 py-4 text-sm">
                            <img src="product_images/${p.image}" alt="${p.name}" 
                                 class="w-12 h-12 object-cover rounded-md border border-gray-100 shadow-sm"
                                 onerror="this.src='https://placehold.co/100x100?text=No+Image'">
                        </td>
                        <td class="px-6 py-4 text-sm font-medium text-gray-900">${p.code}</td>
                        <td class="px-6 py-4 text-sm text-gray-700">${p.name}</td>
                        <td class="px-6 py-4 text-sm text-gray-700">
                            <c:formatNumber value="${p.price}" pattern="#,###"/>
                        </td>
                        <td class="px-6 py-4 text-sm text-center">
                            <div class="flex justify-center gap-2">
                                <a href="controller?action=update&code=${p.code}" 
                                   class="text-blue-600 hover:text-blue-800 font-semibold">Sua</a>
                                <span class="text-gray-300">|</span>
                                <a href="controller?action=delete&code=${p.code}" 
                                   onclick="return confirm('Ban chac chan muon xoa san pham nay?')"
                                   class="text-red-600 hover:text-red-800 font-semibold">Xoa</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="5" class="px-6 py-10 text-center text-gray-400 italic">
                            Khong tim thay san pham nao.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
    
    <div class="mt-6 text-center">
        <a href="controller" class="text-gray-500 hover:text-blue-600 text-sm">Hiển thị tất cả sản phẩm</a>
    </div>
</div>
</body>
</html>
