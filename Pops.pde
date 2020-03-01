//====== Coding by Solazo ====== 
//========= Weibo Solazo ======= 


class Pop {
  //===== 参数声明 ===== 
 
  float[] size = new float[cirLayer];
  float x, y;
  int cato;
  String keyWords;
  TableRow row;
  float scale = 1.5;
  CircleShape cs = new CircleShape();
  BodyDef bd = new BodyDef();
  FixtureDef fd = new FixtureDef();

  Body body;//引用代替坐标

  Pop(float x_, float y_, TableRow Row) {

    //传输数据
    row = Row;
    cato = row.getInt(0);
    //println(cato);
    keyWords = row.getString(1);
   // println(cirLayer);
    //循环读取关键词的数量
    
    //疫情前的图 若要完整的请删除 -12
    for (int i = 2; i<size.length-12; i++) {
      size[i] = row.getInt(cirLayer-i-12)*scale;
    }    
    x = x_;
    y = y_;

    //构建物体
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);

    //构建形状

    cs.m_radius =  box2d.scalarPixelsToWorld((size[2]+10)/2);

    fd.shape = cs;//将刚刚创建的ps对象赋予给夹具对象
    fd.density = 1;//密度
    fd.friction = 0.3;//摩擦系数
    fd.restitution = 1;//弹性

    body.createFixture(fd);//夹具连接形状和物体
  }

  //=====这里主要是外观设置========

  void display() {


    //获取物体的角度和位置
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();  
    pushMatrix();

    translate(pos.x, pos.y);
    rotate(-a);//Box2D的坐标系和Processing相反

    push();
    noFill();

    if (cato == 1) {
      stroke(#F5DB45);
    } else if (cato == 2) {
      stroke(#F545EC);
    } else {
      stroke(255);
    }

    //边框（宽度）
    strokeWeight(1.1);
    //循环绘制圆形
    for (float size : size) {
      circle(0, 0, size);
      circle(0, 0, size+10);
      circle(0, 0, size-10);
    }
    pop();

    //====== 字符 ======
    //push();
    //fill(0);
    //textFont(font);
    //textSize(32);
    //text(keyWords, 0, 0);
    //pop();

    popMatrix();
  }


  void killBody() {
    box2d.destroyBody(body);
  }
}
