/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ui;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.effect.DropShadow;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;

/**
 *
 * @author QUANGTU
 */
public class frHelp {
    Pane root;
    private Double width;
    private Double height;
    HBox QuickContent(String text, String image) {
        DropShadow ds = new DropShadow();
        ds.setOffsetY(3.0f);
        ds.setColor(Color.web("#00A1FF"));
        Text ND2 = new Text(text);
        ND2.setFont(Font.font("Tahoma", FontWeight.NORMAL, width*0.02));
        ND2.setEffect(ds);
        ND2.setFill(Color.WHITE);
        ImageView imageView = new ImageView(
                new Image(getClass().getResource(image).toString()));
        HBox layout = new HBox(width*0.0073);
        layout.setAlignment(Pos.CENTER_LEFT);
        layout.getChildren().addAll(imageView, ND2);
        return layout;
    }
    
     HBox QuickContent1(String text, String image, String text1) {
        DropShadow ds = new DropShadow();
        ds.setOffsetY(3.0f);
        ds.setColor(Color.web("#00A1FF"));
        Text ND2 = new Text(text);
        ND2.setFont(Font.font("Tahoma", FontWeight.NORMAL, width*0.02));
        ND2.setEffect(ds);
        ND2.setFill(Color.WHITE);
        Text ND3 = new Text(text1);
        ND3.setFont(Font.font("Tahoma", FontWeight.NORMAL, width*0.02));
        ND3.setEffect(ds);
        ND3.setFill(Color.WHITE);
        ImageView imageView = new ImageView(
                new Image(getClass().getResource(image).toString()));
        HBox layout = new HBox(width*0.0073);
        layout.setAlignment(Pos.CENTER_LEFT);
        layout.getChildren().addAll(ND2 ,imageView, ND3);
        return layout;
    }

    public frHelp(Pane root) {
        this.root = root;
        this.width = root.getWidth();
        this.height = root.getHeight();
        root.getChildren().clear();
        GridPane grid = new GridPane();
        grid.setPrefSize(root.getWidth(), root.getHeight());
        root.getChildren().add(grid);
        grid.setAlignment(Pos.TOP_LEFT);
        grid.setHgap(width*0.0073);
        grid.setVgap(width*0.0073);
        grid.setPadding(new Insets(85,0,20,20));

        DropShadow ds = new DropShadow();
        ds.setOffsetY(3.0f);
        ds.setColor(Color.web("#00A1FF"));

        HBox align = new HBox();
        align.setPrefSize(root.getPrefWidth(), width*0.073);
        align.setAlignment(Pos.CENTER);
        Text scenetitle = new Text("Luật chơi");
        scenetitle.setFont(Font.font("Tahoma", FontWeight.NORMAL, width*0.0146));
        scenetitle.setEffect(ds);
        scenetitle.setFill(Color.WHITE);
        align.getChildren().add(scenetitle);
        grid.add(scenetitle, 0, 0, 6, 1);
        scenetitle.setFont(new Font("Arial", 50));

        Text ND = new Text("Người chơi sẽ vượt qua 15 câu hỏi của chương trình và có 3 mốc rất quan trọng 5,10,15. ");
        ND.setFont(Font.font("Tahoma", FontWeight.NORMAL, width*0.0146));
        ND.setEffect(ds);
        ND.setFill(Color.WHITE);
        grid.add(ND, 0, 1);
        ND.setFont(new Font("Arial", width*0.02));

        grid.add(QuickContent("Có 2 sự trợ giúp cho bạn trong quá trình chơi:", ""), 0, 2);
        grid.add(QuickContent("Bỏ đi hai phương án sai", "/images/a50-50-acitve.png"), 0, 3);
        grid.add(QuickContent("Đổi câu hỏi", "/images/changeQuiz-active.png"), 0, 4);
        grid.add(QuickContent1("Sử dụng nút", "/images/stopGame-active.png", "để dừng cuộc chơi"), 0, 6);
 
        Text ND4 = new Text("Bạn có thời gian là 60s để trả lời cho mỗi câu hỏi. Trong khi sử dụng  sự trợ giúp, thời gian vẫn\nđược tính.");
        ND4.setFont(Font.font("Tahoma", FontWeight.NORMAL, width*0.0146));
        ND4.setEffect(ds);
        ND4.setFill(Color.WHITE);
        grid.add(ND4, 0, 5);
        ND4.setFont(new Font("Arial", width*0.02));

        Text ND6 = new Text("Trả lời đúng mỗi câu hỏi bạn sễ nhận được mức thưởng tương ứng. Trả lời sai hoặc hết thời gian,\nbạn sẽ nhận phần thưởng của mốc quan trọng trước đó. Nếu chọn dừng cuộc chơi, bạn sẽ được\ngiữ nguyên mức thưởng hiện tại.");
        ND6.setFont(Font.font("Tahoma", FontWeight.NORMAL, width*0.0146));
        ND6.setEffect(ds);
        ND6.setFill(Color.WHITE);
        grid.add(ND6, 0, 7);
        ND6.setFont(new Font("Arial", width*0.02));
        
        Text ND7 = new Text("\t\t\t\t-Câu hỏi hiện tại-\n\t\t\t\tMức thưởng mà bạn sẽ nhận được nếu trả lời đúng");
        ND7.setFont(Font.font("Tahoma", FontWeight.NORMAL, width*0.0146));
        ND7.setEffect(ds);
        ND7.setFill(Color.WHITE);
        grid.add(ND7, 0, 8);
        ND7.setFont(new Font("Arial", width*0.02));
        
        Text ND8 = new Text("\t100$");
        ND8.setFont(Font.font("Tahoma", FontWeight.NORMAL, width*0.0146));
        ND8.setEffect(ds);
        ND8.setFill(Color.WHITE);
        grid.add(ND8, 0, 8);
        ND8.setFont(new Font("Arial", width*0.0292));

        //Quay lai
        Button back = new Button("Quay lại");
        HBox hbback = new HBox(10);
        back.getStyleClass().add("btnCus");
        back.setMinWidth(width*0.11);
        back.setMinHeight(height*0.05);
        hbback.getChildren().add(back);
        hbback.setPadding(new Insets(10));
        root.getChildren().add(hbback);
        final Text actiontarget = new Text();
        grid.add(actiontarget, 1, 6);
        back.setOnMouseClicked((MouseEvent t) -> {
            root.getChildren().clear();
            new listButtonOpen(root);
        });
    }
}
