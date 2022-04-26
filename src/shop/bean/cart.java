package shop.bean;

public class cart {
	private String idSanPham;
	private String tenSanPham;
	private String ColerSanPham;
	private float giaSanPham;
	private int soLuong;
	private String image;
	private int size;
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getIdSanPham() {
		return idSanPham;
	}
	public void setIdSanPham(String idSanPham) {
		this.idSanPham = idSanPham;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public float getGiaSanPham() {
		return giaSanPham;
	}
	public void setGiaSanPham(float giaSanPham) {
		this.giaSanPham = giaSanPham;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getColerSanPham() {
		return ColerSanPham;
	}
	public void setColerSanPham(String colerSanPham) {
		ColerSanPham = colerSanPham;
	}
	public cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public cart(String idSanPham, String tenSanPham, String colerSanPham, float giaSanPham, int soLuong, String image) {
		super();
		this.idSanPham = idSanPham;
		this.tenSanPham = tenSanPham;
		ColerSanPham = colerSanPham;
		this.giaSanPham = giaSanPham;
		this.soLuong = soLuong;
		this.image = image;
	}
	public cart(String idSanPham, String tenSanPham, String colerSanPham, float giaSanPham, int soLuong, String image,
			int size) {
		super();
		this.idSanPham = idSanPham;
		this.tenSanPham = tenSanPham;
		ColerSanPham = colerSanPham;
		this.giaSanPham = giaSanPham;
		this.soLuong = soLuong;
		this.image = image;
		this.size = size;
	}
	public cart(int soLuong, int size) {
		super();
		this.soLuong = soLuong;
		this.size = size;
	}
	
}
