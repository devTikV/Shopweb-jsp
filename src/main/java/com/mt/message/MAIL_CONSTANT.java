package com.mt.message;

import com.mt.helper.MailerHelper;

public class MAIL_CONSTANT {
	MailerHelper mailerHelper=new MailerHelper();
	private String maKhuyenMaiRandom=mailerHelper.randomAlphaNumeric(8);
	public String REGISTER_SALE_SUBJECT="Ưu đãi siêu hot khi lần đầu mua hàng";
	public String REGISTER_SALE_CONTENT2="<h1>Chúc mừng bạn đã nhận được mã giảm giá "+maKhuyenMaiRandom+". Hãy nhanh chóng mua hàng để được hưởng ưu đãi 20% khi sử dụng mã giảm giá.</h1>";
	private String htmlMail="<table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">\r\n"
			+ "  <tr>\r\n"
			+ "    <td align=\"center\" bgcolor=\"#70bbd9\" style=\"padding: 40px 0 30px 0;\">\r\n"
			+ "      <span style=\"font-size: 24px;\r\n"
			+ "      color: #1e1e27;\r\n"
			+ "      font-weight: 700;\r\n"
			+ "      text-transform: uppercase;\">Golden</span><span style=\"font-size: 24px;\r\n"
			+ "	color: #1e1e27;\r\n"
			+ "	font-weight: 700;\r\n"
			+ "	text-transform: uppercase;\r\n"
			+ "  color: #fe4c50;\">Feet</span>\r\n"
			+ "     </td>\r\n"
			+ "  </tr>\r\n"
			+ "  <tr>\r\n"
			+ "    <td bgcolor=\"#ffffff\" style=\"padding: 40px 30px 40px 30px;\">\r\n"
			+ "      <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
			+ "       <tr>\r\n"
			+ "        <td>\r\n"
			+ "         <h1 style=\"color: #f93030; font-size: 20px;\">Khuyến mãi lần đầu tiên mua hàng tại shop của chúng tôi</h1>\r\n"
			+ "        </td>\r\n"
			+ "       </tr>\r\n"
			+ "       <tr>\r\n"
			+ "        <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
			+ "          <tr>\r\n"
			+ "           <td width=\"260\" valign=\"top\">\r\n"
			+ "            <p>Chúc mừng bạn đã nhận được mã khuyến mãi: "+maKhuyenMaiRandom+"</p>\r\n"
			+ "            <p>Hãy sử dụng trong lần đầu mua hàng để được nhận ưu đãi 20%</p>\r\n"
			+ "           </td>\r\n"
			+ "          </tr>\r\n"
			+ "         </table>\r\n"
			+ "       </tr>\r\n"
			+ "       <tr>\r\n"
			+ "        \r\n"
			+ "        <td bgcolor=\"#f86d3f\" align=\"center\">\r\n"
			+ "          <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n"
			+ "           <tr>\r\n"
			+ "            <td>\r\n"
			+ "              &reg; GoldenFeet, 2022<br/>\r\n"
			+ "              Unsubscribe to this newsletter instantly\r\n"
			+ "             </td>\r\n"
			+ "           </tr>\r\n"
			+ "          </table>\r\n"
			+ "         </td>\r\n"
			+ "       </tr>\r\n"
			+ "      </table>\r\n"
			+ "     </td>\r\n"
			+ "  </tr>\r\n"
			+ " </table>";
	public String REGISTER_SALE_CONTENT=htmlMail;
			
}
