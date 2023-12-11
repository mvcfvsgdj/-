package com.sh.product.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sh.login.domain.LoginDTO;
import com.sh.login.service.LoginService;
import com.sh.product.domain.ProductDTO;
import com.sh.product.service.ProductService;

@Controller
public class ProductController {
   //이미지 저장경로
   String fileDir = "c:\\test\\upload\\";

   @Autowired
   private LoginService loginService;
   
   @Autowired
   private ProductService productservice;

   @GetMapping("/products")
   public String getProductList(@ModelAttribute ProductDTO productDTO, HttpServletRequest request) {
      // 상품 목록 조회
      // ProductService를 통해 상품 목록을 가져와서 모델에 추가
      HttpSession session = request.getSession();
      List<ProductDTO> products = productservice.getProductList();

      session.setAttribute("products", products);
      //System.out.println("상품정보=" + products);
      return "products/productList";
   }

   ///////////////////////////// 상품 상세정보
   ///////////////////////////// /////////////////////////////////////////////////////////////////////

   @GetMapping("/products/detail")
      public String showProductDetail(@RequestParam String boardId,@RequestParam String user_code, Model model, HttpServletRequest request) {
        // 상품상세
         String user_heat = loginService.selectHeat(user_code);
         model.addAttribute("user_heat", user_heat);

         // ProductService를 통해 상품 및 이미지 정보 가져오기
         ProductDTO product = productservice.getProductById(boardId);
         HttpSession session = request.getSession();
         productservice.increaseClick(boardId);

         // *** 로그인 정보 받아오기
         LoginDTO login = (LoginDTO) session.getAttribute("user");
         String userId = login.getUser_id();

         // *** 좋아요 기능
         Integer likenum = productservice.getLikeCount(boardId); // 좋아요 수 받아오기
         boolean onClick = productservice.likeClick(boardId, userId,user_code); // 누른적 있는지

         model.addAttribute("likenum", likenum); // 좋아요 수 받아오기
         model.addAttribute("onClick", onClick); // 좋아요 눌렀는지

         // 모델에 상품 정보 추가
         session.setAttribute("product", product);
         return "products/productDetail";
      }

      //끌어올리기
      @PostMapping("/products/updateDate")
      public String updateDate(@RequestParam String boardId) {
         //상품 수정
         productservice.updateDate(boardId);
         return "redirect:/scrollHome";
      }
      
      
      //끌어올리기 Ajax
      @ResponseBody
      @PostMapping("/products/upEvent")
      public void upEvent(@RequestParam String boardId) {
         productservice.updateDate(boardId);
      }
   ///////////////////////////// 상품등록
   ///////////////////////////// /////////////////////////////////////////////////////////////////////

   @GetMapping("/products/add")
   public String showAddProductForm(Model model) {
      // 상품 등록
      String categoriesJson = productservice.getAllCategoriesJson();

      // System.out.println(json2);
      model.addAttribute("item", categoriesJson);

      return "products/addProductForm";
   }

   @PostMapping("/products/add")
   public String addProduct(ProductDTO product, Model model, HttpServletRequest request, MultipartFile file)
         throws IllegalStateException, IOException {
      // ProductService를 통해 상품 추가
      // MultipartFile file 부분은 파일 업로드시 사용

      //System.out.println(product);
      //System.out.println(file);

      // 파일 업로드 부분
      String fileRealName = "";
      if (!file.isEmpty()) {
         fileRealName = file.getOriginalFilename();
      //   System.out.println(fileRealName);
         String fullPath = fileDir + fileRealName; // "C:\\test\\upload\\test.jpg"
         file.transferTo(new File(fullPath));
         model.addAttribute("fileName", fileRealName);
      }

      product.setBoard_Img(fileRealName);
      productservice.insertProductData(product);


      return "redirect:/scrollHome";
   }

   ///////////////////////////// 상품 업데이트 /////////////////

   @GetMapping("/products/update")
   public String updateProductForm(ProductDTO product, @RequestParam String boardId, Model model) {
      product = productservice.getProductById(boardId);
      String categoriesJson = productservice.getAllCategoriesJson();

      // System.out.println(json2);
      model.addAttribute("item", categoriesJson);
      model.addAttribute("product", product);
      return "products/updateProductForm";
   }

   @PostMapping("/products/update")
   public String updateProduct(ProductDTO product, Model model, MultipartFile file, @RequestParam String boardId,
         HttpServletRequest request) throws IllegalStateException, IOException {
      // ProductService를 통해 상품 수정

      String fileRealName = null;

      if (file != null && !file.isEmpty()) {
         fileRealName = file.getOriginalFilename();
         // System.out.println(fileRealName);

         String fullPath = fileDir + fileRealName; // "C:\\test\\upload\\test.jpg"
         file.transferTo(new File(fullPath));
         model.addAttribute("fileName", fileRealName);

         // 이미지 파일이 업데이트되면 데이터베이스에 반영
         product.setBoard_Img(fileRealName);
      }

      // 상품의 boardId 설정
      product.setBoard_Id(boardId);

      // 상품 수정이 성공하면 목록 페이지로 리다이렉션
      int updateResult = productservice.updateProduct(product);
      if (updateResult > 0) {
         //System.out.println("상품 수정 성공!");
         return "redirect:/scrollHome";
      } else {
         //System.out.println("상품 수정 실패!");

         return "redirect:/scrollHome";
      }
   }

   ///////////////////////////// 상품삭제 /////////////////////////////
   @PostMapping("/products/delete")
   public String productDelete(@RequestParam String boardId, @RequestParam String user_code3, Model model) {
      ProductDTO product = productservice.getProductById(boardId);
      productservice.deleteProduct6(user_code3);
      productservice.deleteProduct2(boardId);
      productservice.deleteProduct(boardId);
      model.addAttribute("product", product);
      return "redirect:/scrollHome";
   }

   ///////////////////// 이미지 저장경로,저장하는 코드 ///////////////////// 
   @ResponseBody
   @RequestMapping(value = "/images/{fileName:.*}", method = RequestMethod.GET)
   public Resource imageView(@PathVariable String fileName) throws MalformedURLException {
      return new UrlResource("file:c:\\test\\upload\\" + fileName);
   }

   @ResponseBody
   @GetMapping("/products/likes")
   public int likeNum(String board_Id) {
      int likeNum = productservice.getLikeCount(board_Id);
      return likeNum;
   }

   // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 좋아요 기능
   // *** 추가
   @ResponseBody
   @PostMapping("/products/like")
   public Map<String, Object> likeup(String boardId, String userId,String user_code) {
      System.out.println("유저코드"+user_code);
      boolean onClick = productservice.likeClick(boardId, userId, user_code);
      if(onClick == true) {
         //클릭된 상태라면 -> 관심 삭제
         productservice.deleteLike(boardId, userId);
      }else {
         //클릭 안된상태 -> 관심 추가 
         productservice.insertLike(boardId, userId, user_code);
      }
      
      //클릭 상태 반환
      onClick = !onClick;
      //상품상세 - 좋아요 수 반환
      Integer likenum = productservice.getLikeCount(boardId);
      
      //관심상품 수
      Integer likeCount = productservice.likeNum(userId);

      Map<String, Object> map = new HashMap<String,Object>();
      map.put("likenum", likenum.toString());
      map.put("onClick", onClick);
      map.put("likeCount", likeCount);
      
      return map;
   }

   //좋아요 클릭
   @ResponseBody
   @PostMapping("/products/likeEvent")
   public boolean likeEvent(String userId, String boardId,String user_code) {
      return productservice.likeClick(boardId, userId,user_code);
   }
}