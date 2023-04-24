# Lấy ra danh sách khách hàng có ID nhở hơn 10
select KhachhangID, HoTen, Diachi from Khachhang where KhachhangID < 10

# Thêm 1 bản ghi vào bảng Danhmuc
insert into Danhmuc values (999, 'Laptop giá rẻ', 'Tất cả các loại laptop giá rẻ')

# Cập nhật bản ghi Danhmuc có DanhmucID là 999
update Danhmuc 
set TenDanhMuc = 'Laptop giá rẻ' 
where DanhmucID = 999;

# Xóa bản ghi Danhmuc có DanhmucID là 999
delete from Danhmuc 
where DanhmucID = 999;

# Trigger kiểm tra xem tên sản phẩm trong bảng Sản phẩm có bị trùng hay không
create trigger Trigger_CheckSanPham
on Sanpham
for insert, update
as
begin
	if(select count(a.TenSanPham) from Sanpham a, inserted i where a.TenSanPham = i.TenSanPham) > 1)
		begin
			raiserror('Trùng tên sản phẩm',14,1)
			rollback tran
		end
end