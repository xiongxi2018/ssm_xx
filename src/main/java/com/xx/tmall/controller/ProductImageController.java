package com.xx.tmall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xx.tmall.page.Page;
import com.xx.tmall.pojo.Product;
import com.xx.tmall.pojo.ProductImage;
import com.xx.tmall.service.ProductImageService;
import com.xx.tmall.service.ProductService;
import com.xx.tmall.util.ImageUtil;
import com.xx.tmall.util.UploadedImageFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

@Controller
public class ProductImageController {
    @Autowired
    ProductImageService productImageService;
    @Autowired
    ProductService productService;

    @RequestMapping("admin_productImage_list")
    public String list(Model model,int pid){
        Product p = productService.get(pid);
        List<ProductImage> pisSingle = productImageService.list(pid,productImageService.type_single);
        List<ProductImage> pisDetail = productImageService.list(pid,productImageService.type_detail);
        model.addAttribute("p",p);
        model.addAttribute("pisSingle",pisSingle);
        model.addAttribute("pisDetail",pisDetail);
        return "admin/listProductImage";
    }

    @RequestMapping("admin_productImage_add")
    public String add(ProductImage productImage, HttpSession session, UploadedImageFile uploadedImageFile){
        productImageService.add(productImage);
        String fileName = productImage.getId()+".jpg";
        String imageFolder;
        String imageFolder_small=null;
        String imageFolder_middle=null;
        if(ProductImageService.type_single.equals(productImage.getType())){
            imageFolder = session.getServletContext().getRealPath("img/productSingle");
            imageFolder_small = session.getServletContext().getRealPath("img/productSingle_small");
            imageFolder_middle = session.getServletContext().getRealPath("img/productSingle_middle");
        }else{
            imageFolder = session.getServletContext().getRealPath("img/productDetail");
        }
        File f = new File(imageFolder,fileName);
        f.getParentFile().mkdirs();
        try{
            uploadedImageFile.getImage().transferTo(f);
            BufferedImage img = ImageUtil.change2jpg(f);
            ImageIO.write(img,"jpg",f);

            if (ProductImageService.type_single.equals(productImage.getType())){
                File f_small = new File(imageFolder_small,fileName);
                File f_middle = new File(imageFolder_middle,fileName);

                ImageUtil.resizeImage(f,56,56,f_small);
                ImageUtil.resizeImage(f,217,190,f_middle);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:admin_productImage_list?pid="+productImage.getPid();
    }

    @RequestMapping("admin_productImage_delete")
    public String delete(int id,HttpSession session){
        ProductImage productImage = productImageService.get(id);

        String fileName = productImage.getId()+".jpg";
        String imageFolder;
        String imageFolder_small=null;
        String imageFolder_middle=null;
        if(ProductImageService.type_single.equals(productImage.getType())){
            imageFolder = session.getServletContext().getRealPath("img/productSingle");
            imageFolder_small = session.getServletContext().getRealPath("img/productSingle_small");
            imageFolder_middle = session.getServletContext().getRealPath("img/productSingle_middle");
            File imageFile = new File(imageFolder,fileName);
            File f_small = new File(imageFolder_small,fileName);
            File f_middle = new File(imageFolder_middle,fileName);
            imageFile.delete();
            f_small.delete();
            f_middle.delete();
        }else{
            imageFolder = session.getServletContext().getRealPath("img/productDetail");
            File imageFile = new File(imageFolder,fileName);
            imageFile.delete();
        }

        productImageService.delete(id);
        return "redirect:admin_productImage_list?pid="+productImage.getPid();
    }
}
