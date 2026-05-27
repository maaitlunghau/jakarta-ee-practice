<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Thương Hiệu</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
<div class="container mx-auto px-4 py-8">
    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
        <h1 class="text-3xl font-bold text-gray-800">
            Quản Lý Thương Hiệu
        </h1>

        <div class="flex items-center gap-3 w-full md:w-auto">
            <!-- Nút Thêm Mới -->
            <a href="controller?action=create"
               class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-4 py-2 rounded-lg transition text-sm whitespace-nowrap">
                + Thêm Thương Hiệu Mới
            </a>
        </div>
    </div>

    <!-- Bảng Thương Hiệu -->
    <div class="bg-white rounded-xl shadow overflow-hidden">
        <table class="w-full text-left border-collapse">
            <thead>
            <tr class="bg-gray-50 border-b border-gray-200">
                <th class="px-6 py-4 text-sm font-semibold text-gray-600">ID</th>
                <th class="px-6 py-4 text-sm font-semibold text-gray-600">Tên Thương Hiệu</th>
                <th class="px-6 py-4 text-sm font-semibold text-gray-600">Liên Hệ</th>
                <th class="px-6 py-4 text-sm font-semibold text-gray-600">Website</th>
                <th class="px-6 py-4 text-sm font-semibold text-gray-600 text-center">Thao Tác</th>
            </tr>
            </thead>
            <tbody class="divide-y divide-gray-100">
            <c:forEach var="brand" items="${list}">
                <tr class="hover:bg-gray-50 transition">
                    <td class="px-6 py-4 text-sm text-gray-500 font-mono">${brand.brandId}</td>
                    <td class="px-6 py-4 text-sm font-medium text-gray-900">${brand.name}</td>
                    <td class="px-6 py-4 text-sm text-gray-700">${brand.contact}</td>
                    <td class="px-6 py-4 text-sm text-blue-600">
                        <a href="${brand.website}" target="_blank" class="hover:underline italic">${brand.website}</a>
                    </td>
                    <td class="px-6 py-4 text-sm text-center">
                        <div class="flex justify-center gap-2">
                            <a href="controller?action=update&id=${brand.brandId}"
                               class="text-blue-600 hover:text-blue-800 font-semibold">Sửa</a>
                            <span class="text-gray-300">|</span>
                            <a href="controller?action=delete&id=${brand.brandId}"
                               onclick="return confirm('Bạn chắc chắn muốn xóa thương hiệu này?')"
                               class="text-red-600 hover:text-red-800 font-semibold">Xóa</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty list}">
                <tr>
                    <td colspan="5" class="px-6 py-10 text-center text-gray-400 italic">
                        Chưa có thương hiệu nào trong danh sách.
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

    <div class="mt-6 text-center">
        <a href="controller" class="text-gray-500 hover:text-blue-600 text-sm italic">Cập nhật lại danh sách</a>
    </div>
</div>
</body>
</html>
