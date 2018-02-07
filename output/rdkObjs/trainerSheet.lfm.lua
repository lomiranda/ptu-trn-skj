require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmPtuTrainer()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setDataType("br.com.shakerskj.ptu_trn");
    obj:setTitle("PTU Trainer Sheet");
    obj:setName("frmPtuTrainer");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setLeft(10);
    obj.scrollBox1:setTop(10);
    obj.scrollBox1:setWidth(600);
    obj.scrollBox1:setHeight(250);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setOrientation("horizontal");
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setMargins({top=8, left=20, right=20});
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(600);
    obj.flowPart1:setMaxWidth(600);
    obj.flowPart1:setHeight(750);
    obj.flowPart1:setAdjustHeightToLine(true);
    obj.flowPart1:setName("flowPart1");

    obj.topLayout = gui.fromHandle(_obj_newObject("layout"));
    obj.topLayout:setParent(obj.flowPart1);
    obj.topLayout:setName("topLayout");
    obj.topLayout:setAlign("top");
    obj.topLayout:setMargins({top=10, bottom=4, left=26, right=26});

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.topLayout);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("transparent");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setXradius(25);
    obj.rectangle1:setYradius(25);
    obj.rectangle1:setCornerType("innerRound");
    obj.rectangle1:setStrokeDash("dash");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setText("-=| FICHA TREINADOR |=-");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontSize(18);
    obj.label1:setAlign("client");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");
    obj.label1:setFontColor("Moccasin");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.flowPart1);
    obj.tabControl1:setLeft(20);
    obj.tabControl1:setTop(20);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Identificação");
    obj.tab1:setName("tab1");

    obj.bodyLayout = gui.fromHandle(_obj_newObject("layout"));
    obj.bodyLayout:setParent(obj.tab1);
    obj.bodyLayout:setName("bodyLayout");
    obj.bodyLayout:setAlign("client");

    obj.firstSection = gui.fromHandle(_obj_newObject("layout"));
    obj.firstSection:setParent(obj.bodyLayout);
    obj.firstSection:setName("firstSection");
    obj.firstSection:setAlign("top");
    obj.firstSection:setHeight(310);

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.firstSection);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setMargins({top=8, left=10, right=10});
    obj.rectangle2:setName("rectangle2");
    obj.rectangle2:setColor("transparent");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setCornerType("bevel");
    obj.rectangle2:setStrokeDash("dash");

    obj.infoSection = gui.fromHandle(_obj_newObject("layout"));
    obj.infoSection:setParent(obj.rectangle2);
    obj.infoSection:setName("infoSection");
    obj.infoSection:setAlign("left");
    obj.infoSection:setWidth(300);
    obj.infoSection:setMargins({left=5, top=8});

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.infoSection);
    obj.layout1:setAlign("top");
    obj.layout1:setWidth(250);
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({top=10,left=5});
    obj.layout1:setName("layout1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setText("Jogador:");
    obj.label2:setAlign("left");
    obj.label2:setWidth(80);
    obj.label2:setName("label2");
    obj.label2:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(200);
    obj.rectangle3:setMargins({left=10});
    obj.rectangle3:setName("rectangle3");
    obj.rectangle3:setColor("transparent");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setStrokeDash("dash");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle3);
    obj.edit1:setField("trainerPlayer");
    obj.edit1:setAlign("client");
    obj.edit1:setTransparent(true);
    obj.edit1:setMargins({left=5,right=5});
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("White");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.infoSection);
    obj.layout2:setAlign("top");
    obj.layout2:setWidth(250);
    obj.layout2:setHeight(30);
    obj.layout2:setMargins({top=10,left=5});
    obj.layout2:setName("layout2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setText("Personagem:");
    obj.label3:setAlign("left");
    obj.label3:setWidth(80);
    obj.label3:setName("label3");
    obj.label3:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout2);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(200);
    obj.rectangle4:setMargins({left=10});
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4:setColor("transparent");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setCornerType("bevel");
    obj.rectangle4:setStrokeDash("dash");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle4);
    obj.edit2:setField("trainerName");
    obj.edit2:setAlign("client");
    obj.edit2:setTransparent(true);
    obj.edit2:setMargins({left=5,right=15});
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("White");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle4);
    obj.layout3:setAlign("right");
    obj.layout3:setWidth(20);
    obj.layout3:setMargins({top=5, right=10, bottom=5});
    obj.layout3:setName("layout3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setAlign("client");
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.trainerIDPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.trainerIDPopUp:setParent(obj.layout2);
    obj.trainerIDPopUp:setName("trainerIDPopUp");
    obj.trainerIDPopUp:setWidth(450);
    obj.trainerIDPopUp:setHeight(600);
    obj.trainerIDPopUp:setBackOpacity(0.5);

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.trainerIDPopUp);
    obj.label4:setText("INFORMAÇÕES DO TREINADOR");
    obj.label4:setAlign("top");
    obj.label4:setHeight(50);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");
    obj.label4:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontSize(18);

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.trainerIDPopUp);
    obj.layout4:setAlign("top");
    obj.layout4:setWidth(250);
    obj.layout4:setHeight(40);
    obj.layout4:setMargins({top=10,left=5});
    obj.layout4:setName("layout4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setText("Nome:");
    obj.label5:setAlign("left");
    obj.label5:setWidth(80);
    obj.label5:setMargins({left=5});
    obj.label5:setName("label5");
    obj.label5:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout4);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setWidth(200);
    obj.rectangle5:setMargins({left=10});
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setColor("transparent");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);
    obj.rectangle5:setCornerType("bevel");
    obj.rectangle5:setStrokeDash("dash");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle5);
    obj.edit3:setField("trainerName");
    obj.edit3:setAlign("client");
    obj.edit3:setTransparent(true);
    obj.edit3:setMargins({left=5,right=15});
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("White");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout4);
    obj.label6:setText("Nível:");
    obj.label6:setAlign("right");
    obj.label6:setMargins({right=10});
    obj.label6:setWidth(45);
    obj.label6:setName("label6");
    obj.label6:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout4);
    obj.rectangle6:setAlign("right");
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setMargins({right=12});
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setColor("transparent");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setCornerType("bevel");
    obj.rectangle6:setStrokeDash("dash");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle6);
    obj.edit4:setField("trainerLevel");
    obj.edit4:setAlign("client");
    obj.edit4:setType("number");
    obj.edit4:setTransparent(true);
    obj.edit4:setMargins({left=5,right=5});
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("White");
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.trainerIDPopUp);
    obj.layout5:setAlign("top");
    obj.layout5:setWidth(250);
    obj.layout5:setHeight(40);
    obj.layout5:setMargins({top=10,left=5});
    obj.layout5:setName("layout5");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout5);
    obj.label7:setText("Gênero:");
    obj.label7:setAlign("left");
    obj.label7:setWidth(80);
    obj.label7:setMargins({left=5});
    obj.label7:setName("label7");
    obj.label7:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout5);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setWidth(200);
    obj.rectangle7:setMargins({left=10});
    obj.rectangle7:setName("rectangle7");
    obj.rectangle7:setColor("transparent");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setCornerType("bevel");
    obj.rectangle7:setStrokeDash("dash");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle7);
    obj.edit5:setField("trainerGender");
    obj.edit5:setAlign("client");
    obj.edit5:setTransparent(true);
    obj.edit5:setMargins({left=5,right=15});
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("White");
    lfm_setPropAsString(obj.edit5, "fontStyle",  "bold");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout5);
    obj.label8:setText("Idade:");
    obj.label8:setAlign("right");
    obj.label8:setMargins({right=10});
    obj.label8:setWidth(45);
    obj.label8:setName("label8");
    obj.label8:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout5);
    obj.rectangle8:setAlign("right");
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setMargins({right=12});
    obj.rectangle8:setName("rectangle8");
    obj.rectangle8:setColor("transparent");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setXradius(10);
    obj.rectangle8:setYradius(10);
    obj.rectangle8:setCornerType("bevel");
    obj.rectangle8:setStrokeDash("dash");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle8);
    obj.edit6:setField("trainerAge");
    obj.edit6:setAlign("client");
    obj.edit6:setType("number");
    obj.edit6:setTransparent(true);
    obj.edit6:setMargins({left=5,right=5});
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("White");
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.trainerIDPopUp);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(40);
    obj.layout6:setMargins({top=10, left=5});
    obj.layout6:setName("layout6");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout6);
    obj.label9:setText("Cidade:");
    obj.label9:setWidth(80);
    obj.label9:setAlign("left");
    obj.label9:setMargins({left=5});
    obj.label9:setName("label9");
    obj.label9:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout6);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(330);
    obj.rectangle9:setMargins({left=10});
    obj.rectangle9:setName("rectangle9");
    obj.rectangle9:setColor("transparent");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setXradius(10);
    obj.rectangle9:setYradius(10);
    obj.rectangle9:setCornerType("bevel");
    obj.rectangle9:setStrokeDash("dash");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle9);
    obj.edit7:setField("trainerHomeCity");
    obj.edit7:setAlign("client");
    obj.edit7:setTransparent(true);
    obj.edit7:setMargins({left=5,right=15});
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("White");
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.trainerIDPopUp);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(40);
    obj.layout7:setMargins({top=10, left=5});
    obj.layout7:setName("layout7");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout7);
    obj.label10:setText("Peso [C]:");
    obj.label10:setWidth(80);
    obj.label10:setWordWrap(true);
    obj.label10:setAlign("left");
    obj.label10:setMargins({left=5});
    obj.label10:setName("label10");
    obj.label10:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout7);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setWidth(330);
    obj.rectangle10:setMargins({left=10});
    obj.rectangle10:setName("rectangle10");
    obj.rectangle10:setColor("transparent");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setXradius(10);
    obj.rectangle10:setYradius(10);
    obj.rectangle10:setCornerType("bevel");
    obj.rectangle10:setStrokeDash("dash");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle10);
    obj.edit8:setField("trainerWeight");
    obj.edit8:setAlign("client");
    obj.edit8:setTransparent(true);
    obj.edit8:setMargins({left=5,right=15});
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("White");
    lfm_setPropAsString(obj.edit8, "fontStyle",  "bold");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.trainerIDPopUp);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(40);
    obj.layout8:setMargins({top=10, left=5});
    obj.layout8:setName("layout8");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout8);
    obj.label11:setText("Altura [C]:");
    obj.label11:setWidth(80);
    obj.label11:setAlign("left");
    obj.label11:setMargins({left=5});
    obj.label11:setName("label11");
    obj.label11:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout8);
    obj.rectangle11:setAlign("left");
    obj.rectangle11:setWidth(330);
    obj.rectangle11:setMargins({left=10});
    obj.rectangle11:setName("rectangle11");
    obj.rectangle11:setColor("transparent");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setCornerType("bevel");
    obj.rectangle11:setStrokeDash("dash");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle11);
    obj.edit9:setField("trainerHeight");
    obj.edit9:setAlign("client");
    obj.edit9:setTransparent(true);
    obj.edit9:setMargins({left=5,right=15});
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("White");
    lfm_setPropAsString(obj.edit9, "fontStyle",  "bold");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.trainerIDPopUp);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(100);
    obj.layout9:setMargins({top=10, left=5});
    obj.layout9:setName("layout9");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout9);
    obj.label12:setText("Personalidade:");
    obj.label12:setFontSize(11);
    obj.label12:setWidth(80);
    obj.label12:setWordWrap(true);
    obj.label12:setAlign("left");
    obj.label12:setMargins({left=5});
    obj.label12:setName("label12");
    obj.label12:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout9);
    obj.rectangle12:setAlign("left");
    obj.rectangle12:setWidth(330);
    obj.rectangle12:setMargins({left=10});
    obj.rectangle12:setName("rectangle12");
    obj.rectangle12:setColor("transparent");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setXradius(10);
    obj.rectangle12:setYradius(10);
    obj.rectangle12:setCornerType("bevel");
    obj.rectangle12:setStrokeDash("dash");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle12);
    obj.textEditor1:setField("trainerPersonality");
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setMargins({top=5, bottom=5, left=15, right=15});
    obj.textEditor1:setHorzTextAlign("leading");
    obj.textEditor1:setName("textEditor1");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.trainerIDPopUp);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(150);
    obj.layout10:setMargins({top=10, left=5});
    obj.layout10:setName("layout10");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout10);
    obj.label13:setText("História:");
    obj.label13:setWidth(80);
    obj.label13:setAlign("left");
    obj.label13:setMargins({left=5});
    obj.label13:setName("label13");
    obj.label13:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout10);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setWidth(330);
    obj.rectangle13:setMargins({left=10});
    obj.rectangle13:setName("rectangle13");
    obj.rectangle13:setColor("transparent");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setXradius(10);
    obj.rectangle13:setYradius(10);
    obj.rectangle13:setCornerType("bevel");
    obj.rectangle13:setStrokeDash("dash");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle13);
    obj.textEditor2:setField("trainerHistory");
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setMargins({top=5, bottom=5, left=15, right=15});
    obj.textEditor2:setHorzTextAlign("leading");
    obj.textEditor2:setName("textEditor2");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.infoSection);
    obj.layout11:setAlign("top");
    obj.layout11:setWidth(250);
    obj.layout11:setHeight(30);
    obj.layout11:setMargins({top=10,left=5});
    obj.layout11:setName("layout11");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14:setText("Background:");
    obj.label14:setFontSize(12);
    obj.label14:setAlign("left");
    obj.label14:setWidth(80);
    obj.label14:setName("label14");
    obj.label14:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout11);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(200);
    obj.rectangle14:setMargins({left=10});
    obj.rectangle14:setName("rectangle14");
    obj.rectangle14:setColor("transparent");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setXradius(10);
    obj.rectangle14:setYradius(10);
    obj.rectangle14:setCornerType("bevel");
    obj.rectangle14:setStrokeDash("dash");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle14);
    obj.edit10:setField("trainerBackground");
    obj.edit10:setAlign("client");
    obj.edit10:setTransparent(true);
    obj.edit10:setMargins({left=5,right=5});
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("White");
    lfm_setPropAsString(obj.edit10, "fontStyle",  "bold");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.infoSection);
    obj.layout12:setAlign("top");
    obj.layout12:setWidth(250);
    obj.layout12:setHeight(30);
    obj.layout12:setMargins({top=10,left=5});
    obj.layout12:setName("layout12");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout12);
    obj.label15:setText("Peso [C]:");
    obj.label15:setAlign("left");
    obj.label15:setWidth(80);
    obj.label15:setName("label15");
    obj.label15:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout12);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(200);
    obj.rectangle15:setMargins({left=10});
    obj.rectangle15:setName("rectangle15");
    obj.rectangle15:setColor("transparent");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setXradius(10);
    obj.rectangle15:setYradius(10);
    obj.rectangle15:setCornerType("bevel");
    obj.rectangle15:setStrokeDash("dash");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle15);
    obj.edit11:setField("trainerWeight");
    obj.edit11:setAlign("client");
    obj.edit11:setTransparent(true);
    obj.edit11:setMargins({left=5,right=5});
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("White");
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.infoSection);
    obj.layout13:setAlign("top");
    obj.layout13:setWidth(250);
    obj.layout13:setHeight(115);
    obj.layout13:setMargins({top=10,left=5});
    obj.layout13:setName("layout13");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout13);
    obj.label16:setText("Lesões:");
    obj.label16:setAlign("left");
    obj.label16:setWidth(80);
    obj.label16:setVertTextAlign("center");
    obj.label16:setName("label16");
    obj.label16:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout13);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(200);
    obj.rectangle16:setHeight(80);
    obj.rectangle16:setMargins({left=10});
    obj.rectangle16:setName("rectangle16");
    obj.rectangle16:setColor("transparent");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setXradius(10);
    obj.rectangle16:setYradius(10);
    obj.rectangle16:setCornerType("bevel");
    obj.rectangle16:setStrokeDash("dash");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.rectangle16);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setName("rectangle17");
    obj.rectangle17:setColor("transparent");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setXradius(10);
    obj.rectangle17:setYradius(10);
    obj.rectangle17:setCornerType("bevel");
    obj.rectangle17:setStrokeDash("dash");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle17);
    obj.comboBox1:setField("trainerInjuriesQtd");
    obj.comboBox1:setText("Escolha");
    obj.comboBox1:setAlign("client");
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setMargins({left=10});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'0', '1', '2', '3', '4', '5'});
    obj.comboBox1:setValues({'0', '1', '2', '3', '4', '5'});
    obj.comboBox1:setValue("0");
    obj.comboBox1:setFontColor("White");
    obj.comboBox1:setName("comboBox1");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle16);
    obj.textEditor3:setField("trainerInjuries");
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setMargins({left=5, right=5});
    obj.textEditor3:setHorzTextAlign("leading");
    obj.textEditor3:setName("textEditor3");

    obj.imageSection = gui.fromHandle(_obj_newObject("layout"));
    obj.imageSection:setParent(obj.rectangle2);
    obj.imageSection:setName("imageSection");
    obj.imageSection:setAlign("right");
    obj.imageSection:setWidth(250);
    obj.imageSection:setMargins({top=8, right=15});

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.imageSection);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(250);
    obj.layout14:setName("layout14");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout14);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("white");
    obj.rectangle18:setStrokeColor("black");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setCornerType("innerLine");
    obj.rectangle18:setStrokeDash("dash");
    obj.rectangle18:setName("rectangle18");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle18);
    obj.image1:setField("trainerImage");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setLeft(5);
    obj.image1:setTop(5);
    obj.image1:setWidth(240);
    obj.image1:setHeight(240);
    obj.image1:setName("image1");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.imageSection);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(30);
    obj.layout15:setMargins({top=5, left=5});
    obj.layout15:setName("layout15");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout15);
    obj.label17:setText("Nível:");
    obj.label17:setAlign("left");
    obj.label17:setWidth(50);
    obj.label17:setName("label17");
    obj.label17:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout15);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setMargins({left=5});
    obj.rectangle19:setName("rectangle19");
    obj.rectangle19:setColor("transparent");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setXradius(10);
    obj.rectangle19:setYradius(10);
    obj.rectangle19:setCornerType("bevel");
    obj.rectangle19:setStrokeDash("dash");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle19);
    obj.edit12:setField("trainerLevel");
    obj.edit12:setAlign("client");
    obj.edit12:setType("number");
    obj.edit12:setTransparent(true);
    obj.edit12:setMargins({left=5,right=5});
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");
    obj.edit12:setFontColor("White");
    lfm_setPropAsString(obj.edit12, "fontStyle",  "bold");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout15);
    obj.label18:setText("EXP: ");
    obj.label18:setAlign("left");
    obj.label18:setWidth(30);
    obj.label18:setMargins({left=15});
    obj.label18:setName("label18");
    obj.label18:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");

    obj.progressBar1 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout15);
    obj.progressBar1:setAlign("left");
    obj.progressBar1:setWidth(80);
    obj.progressBar1:setHeight(20);
    obj.progressBar1:setColor("blue");
    obj.progressBar1:setHitTest(true);
    obj.progressBar1:setMargins({left=10});
    obj.progressBar1:setColorMode("hl");
    obj.progressBar1:setField("trainerCurXP");
    obj.progressBar1:setFieldMax("trainerTrgtXP");
    obj.progressBar1:setName("progressBar1");

    obj.xpPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.xpPopUp:setParent(obj.layout15);
    obj.xpPopUp:setName("xpPopUp");
    obj.xpPopUp:setWidth(420);
    obj.xpPopUp:setHeight(110);
    obj.xpPopUp:setBackOpacity(0.5);

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.xpPopUp);
    obj.label19:setText("EXPERIÊNCIA");
    obj.label19:setAlign("top");
    obj.label19:setHeight(30);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");
    obj.label19:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setFontSize(18);

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.xpPopUp);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(50);
    obj.layout16:setMargins({top=10});
    obj.layout16:setName("layout16");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout16);
    obj.rectangle20:setAlign("left");
    obj.rectangle20:setWidth(170);
    obj.rectangle20:setMargins({left=10});
    obj.rectangle20:setName("rectangle20");
    obj.rectangle20:setColor("transparent");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setXradius(10);
    obj.rectangle20:setYradius(10);
    obj.rectangle20:setCornerType("bevel");
    obj.rectangle20:setStrokeDash("dash");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle20);
    obj.edit13:setField("trainerCurXP");
    obj.edit13:setAlign("client");
    obj.edit13:setTransparent(true);
    obj.edit13:setMargins({left=10});
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("White");
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout16);
    obj.label20:setText("/");
    obj.label20:setAlign("left");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setFontSize(18);
    obj.label20:setWidth(10);
    obj.label20:setMargins({left=20});
    obj.label20:setName("label20");
    obj.label20:setFontColor("Moccasin");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout16);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(170);
    obj.rectangle21:setMargins({left=20});
    obj.rectangle21:setName("rectangle21");
    obj.rectangle21:setColor("transparent");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setXradius(10);
    obj.rectangle21:setYradius(10);
    obj.rectangle21:setCornerType("bevel");
    obj.rectangle21:setStrokeDash("dash");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle21);
    obj.edit14:setField("trainerTrgtXP");
    obj.edit14:setAlign("client");
    obj.edit14:setTransparent(true);
    obj.edit14:setMargins({left=10});
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("White");
    lfm_setPropAsString(obj.edit14, "fontStyle",  "bold");

    obj.secondSection = gui.fromHandle(_obj_newObject("layout"));
    obj.secondSection:setParent(obj.bodyLayout);
    obj.secondSection:setName("secondSection");
    obj.secondSection:setAlign("top");
    obj.secondSection:setHeight(340);
    obj.secondSection:setMargins({top=5});

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.secondSection);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setMargins({top=8, bottom=4, left=10, right=10});
    obj.rectangle22:setName("rectangle22");
    obj.rectangle22:setColor("transparent");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setXradius(10);
    obj.rectangle22:setYradius(10);
    obj.rectangle22:setCornerType("bevel");
    obj.rectangle22:setStrokeDash("dash");

    obj.statsSection1 = gui.fromHandle(_obj_newObject("layout"));
    obj.statsSection1:setParent(obj.rectangle22);
    obj.statsSection1:setName("statsSection1");
    obj.statsSection1:setAlign("top");
    obj.statsSection1:setHeight(30);
    obj.statsSection1:setMargins({top=5});

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.statsSection1);
    obj.label21:setText("Pontos Vida:");
    obj.label21:setAlign("left");
    obj.label21:setWidth(100);
    obj.label21:setMargins({left=10});
    obj.label21:setName("label21");
    obj.label21:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.statsSection1);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(200);
    obj.rectangle23:setName("rectangle23");
    obj.rectangle23:setColor("transparent");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setXradius(10);
    obj.rectangle23:setYradius(10);
    obj.rectangle23:setCornerType("bevel");
    obj.rectangle23:setStrokeDash("dash");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle23);
    obj.edit15:setField("trainerCurPV");
    obj.edit15:setAlign("left");
    obj.edit15:setWidth(80);
    obj.edit15:setType("number");
    obj.edit15:setTransparent(true);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("White");
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle23);
    obj.label22:setText("/");
    obj.label22:setFontSize(14);
    obj.label22:setAlign("left");
    obj.label22:setWidth(10);
    obj.label22:setMargins({left=10, right=10});
    obj.label22:setName("label22");
    obj.label22:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle23);
    obj.label23:setField("trainerMaxPV");
    obj.label23:setAlign("left");
    obj.label23:setWidth(80);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setVertTextAlign("center");
    obj.label23:setName("label23");
    obj.label23:setFontColor("Orange");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.statsSection1);
    obj.label24:setText("AP:");
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setAlign("left");
    obj.label24:setWidth(30);
    obj.label24:setMargins({left=20});
    obj.label24:setName("label24");
    obj.label24:setFontColor("Moccasin");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.statsSection1);
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(200);
    obj.rectangle24:setName("rectangle24");
    obj.rectangle24:setColor("transparent");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setXradius(10);
    obj.rectangle24:setYradius(10);
    obj.rectangle24:setCornerType("bevel");
    obj.rectangle24:setStrokeDash("dash");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle24);
    obj.edit16:setField("trainerCurAP");
    obj.edit16:setAlign("left");
    obj.edit16:setWidth(80);
    obj.edit16:setType("number");
    obj.edit16:setTransparent(true);
    obj.edit16:setMargins({left=5, right=5});
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("White");
    lfm_setPropAsString(obj.edit16, "fontStyle",  "bold");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle24);
    obj.label25:setText("/");
    obj.label25:setFontSize(14);
    obj.label25:setAlign("left");
    obj.label25:setWidth(10);
    obj.label25:setMargins({left=10, right=10});
    obj.label25:setName("label25");
    obj.label25:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle24);
    obj.label26:setField("trainerAP");
    obj.label26:setAlign("left");
    obj.label26:setWidth(80);
    obj.label26:setMargins({left=5, right=5});
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");
    obj.label26:setFontColor("Orange");
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");

    obj.stats = gui.fromHandle(_obj_newObject("layout"));
    obj.stats:setParent(obj.rectangle22);
    obj.stats:setName("stats");
    obj.stats:setAlign("top");
    obj.stats:setHeight(130);
    obj.stats:setMargins({top=10});

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.stats);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setMargins({left=5, right=5});
    obj.rectangle25:setName("rectangle25");
    obj.rectangle25:setColor("transparent");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setXradius(10);
    obj.rectangle25:setYradius(10);
    obj.rectangle25:setCornerType("bevel");
    obj.rectangle25:setStrokeDash("dash");

    obj.statsLine1 = gui.fromHandle(_obj_newObject("layout"));
    obj.statsLine1:setParent(obj.rectangle25);
    obj.statsLine1:setName("statsLine1");
    obj.statsLine1:setAlign("top");
    obj.statsLine1:setMargins({top=10});

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.statsLine1);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(180);
    obj.layout17:setHeight(30);
    obj.layout17:setMargins({right=5});
    obj.layout17:setName("layout17");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout17);
    obj.label27:setText("HP:");
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setAlign("left");
    obj.label27:setMargins({left=10});
    obj.label27:setWidth(60);
    obj.label27:setName("label27");
    obj.label27:setFontColor("Moccasin");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout17);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(60);
    obj.rectangle26:setMargins({left=10});
    obj.rectangle26:setName("rectangle26");
    obj.rectangle26:setColor("transparent");
    obj.rectangle26:setStrokeColor("Orange");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setXradius(10);
    obj.rectangle26:setYradius(10);
    obj.rectangle26:setCornerType("innerRound");
    obj.rectangle26:setStrokeDash("dash");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle26);
    obj.label28:setField("trainerTotalHP");
    obj.label28:setAlign("client");
    obj.label28:setMargins({left=5,right=5});
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");
    obj.label28:setFontColor("Orange");
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");

    obj.hpPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.hpPopUp:setParent(obj.layout17);
    obj.hpPopUp:setName("hpPopUp");
    obj.hpPopUp:setWidth(255);
    obj.hpPopUp:setHeight(150);
    obj.hpPopUp:setBackOpacity(0.5);

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.hpPopUp);
    obj.label29:setText("HP");
    obj.label29:setAlign("top");
    obj.label29:setHeight(30);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");
    obj.label29:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setFontSize(18);

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.hpPopUp);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(150);
    obj.layout18:setMargins({top=10});
    obj.layout18:setName("layout18");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(40);
    obj.layout19:setWidth(400);
    obj.layout19:setMargins({bottom=4});
    obj.layout19:setName("layout19");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout19);
    obj.label30:setText("Total");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setWordWrap(true);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setAlign("left");
    obj.label30:setMargins({left=10});
    obj.label30:setWidth(70);
    obj.label30:setName("label30");
    obj.label30:setFontColor("Moccasin");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout19);
    obj.label31:setText("Valor");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setWordWrap(true);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setAlign("left");
    obj.label31:setMargins({left=10});
    obj.label31:setWidth(70);
    obj.label31:setName("label31");
    obj.label31:setFontColor("Moccasin");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout19);
    obj.label32:setText("Lesões");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setWordWrap(true);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setAlign("left");
    obj.label32:setMargins({left=10});
    obj.label32:setWidth(70);
    obj.label32:setName("label32");
    obj.label32:setFontColor("Moccasin");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout18);
    obj.layout20:setAlign("top");
    obj.layout20:setMargins({bottom=4});
    obj.layout20:setName("layout20");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout20);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setWidth(70);
    obj.rectangle27:setMargins({left=10});
    obj.rectangle27:setName("rectangle27");
    obj.rectangle27:setColor("transparent");
    obj.rectangle27:setStrokeColor("Orange");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setXradius(10);
    obj.rectangle27:setYradius(10);
    obj.rectangle27:setCornerType("innerRound");
    obj.rectangle27:setStrokeDash("dash");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle27);
    obj.label33:setField("trainerTotalHP");
    obj.label33:setAlign("client");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWidth(40);
    obj.label33:setName("label33");
    obj.label33:setFontColor("Orange");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout20);
    obj.rectangle28:setAlign("left");
    obj.rectangle28:setWidth(70);
    obj.rectangle28:setMargins({left=10});
    obj.rectangle28:setName("rectangle28");
    obj.rectangle28:setColor("transparent");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setXradius(10);
    obj.rectangle28:setYradius(10);
    obj.rectangle28:setCornerType("bevel");
    obj.rectangle28:setStrokeDash("dash");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle28);
    obj.edit17:setField("trainerHP");
    obj.edit17:setType("number");
    obj.edit17:setTransparent(true);
    lfm_setPropAsString(obj.edit17, "fontStyle",  "bold");
    obj.edit17:setAlign("client");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setWidth(40);
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("White");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout20);
    obj.rectangle29:setAlign("left");
    obj.rectangle29:setWidth(70);
    obj.rectangle29:setMargins({left=10});
    obj.rectangle29:setName("rectangle29");
    obj.rectangle29:setColor("transparent");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setXradius(10);
    obj.rectangle29:setYradius(10);
    obj.rectangle29:setCornerType("bevel");
    obj.rectangle29:setStrokeDash("dash");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle29);
    obj.comboBox2:setField("trainerInjuriesQtd");
    obj.comboBox2:setText("Escolha");
    obj.comboBox2:setAlign("client");
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setMargins({left=10});
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'0', '1', '2', '3', '4', '5'});
    obj.comboBox2:setValues({'0', '1', '2', '3', '4', '5',});
    obj.comboBox2:setValue("0");
    obj.comboBox2:setFontColor("White");
    obj.comboBox2:setName("comboBox2");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout17);
    obj.button2:setAlign("left");
    obj.button2:setText("i");
    obj.button2:setWidth(20);
    obj.button2:setMargins({left=5});
    obj.button2:setName("button2");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.statsLine1);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(180);
    obj.layout21:setHeight(40);
    obj.layout21:setMargins({right=5});
    obj.layout21:setName("layout21");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout21);
    obj.label34:setText("Attack:");
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setAlign("left");
    obj.label34:setMargins({left=10});
    obj.label34:setWidth(60);
    obj.label34:setName("label34");
    obj.label34:setFontColor("Moccasin");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout21);
    obj.rectangle30:setAlign("left");
    obj.rectangle30:setWidth(60);
    obj.rectangle30:setMargins({left=10});
    obj.rectangle30:setName("rectangle30");
    obj.rectangle30:setColor("transparent");
    obj.rectangle30:setStrokeColor("Orange");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setXradius(10);
    obj.rectangle30:setYradius(10);
    obj.rectangle30:setCornerType("innerRound");
    obj.rectangle30:setStrokeDash("dash");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle30);
    obj.label35:setField("trainerTotalAtk");
    obj.label35:setAlign("client");
    obj.label35:setMargins({left=5,right=5});
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");
    obj.label35:setFontColor("Orange");
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");

    obj.atkPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.atkPopUp:setParent(obj.layout21);
    obj.atkPopUp:setName("atkPopUp");
    obj.atkPopUp:setWidth(255);
    obj.atkPopUp:setHeight(150);
    obj.atkPopUp:setBackOpacity(0.5);

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.atkPopUp);
    obj.label36:setText("ATTACK");
    obj.label36:setAlign("top");
    obj.label36:setHeight(30);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");
    obj.label36:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");
    obj.label36:setFontSize(18);

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.atkPopUp);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(150);
    obj.layout22:setMargins({top=10});
    obj.layout22:setName("layout22");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout22);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(40);
    obj.layout23:setWidth(400);
    obj.layout23:setMargins({bottom=4});
    obj.layout23:setName("layout23");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout23);
    obj.label37:setText("Total");
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setWordWrap(true);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setAlign("left");
    obj.label37:setMargins({left=10});
    obj.label37:setWidth(70);
    obj.label37:setName("label37");
    obj.label37:setFontColor("Moccasin");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout23);
    obj.label38:setText("Valor");
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setWordWrap(true);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setAlign("left");
    obj.label38:setMargins({left=10});
    obj.label38:setWidth(70);
    obj.label38:setName("label38");
    obj.label38:setFontColor("Moccasin");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout23);
    obj.label39:setText("Combat Stage");
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setWordWrap(true);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setAlign("left");
    obj.label39:setMargins({left=10});
    obj.label39:setWidth(70);
    obj.label39:setName("label39");
    obj.label39:setFontColor("Moccasin");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout22);
    obj.layout24:setAlign("top");
    obj.layout24:setMargins({bottom=4});
    obj.layout24:setName("layout24");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout24);
    obj.rectangle31:setAlign("left");
    obj.rectangle31:setWidth(70);
    obj.rectangle31:setMargins({left=10});
    obj.rectangle31:setName("rectangle31");
    obj.rectangle31:setColor("transparent");
    obj.rectangle31:setStrokeColor("Orange");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setXradius(10);
    obj.rectangle31:setYradius(10);
    obj.rectangle31:setCornerType("innerRound");
    obj.rectangle31:setStrokeDash("dash");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle31);
    obj.label40:setField("trainerTotalAtk");
    obj.label40:setAlign("client");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setWidth(40);
    obj.label40:setName("label40");
    obj.label40:setFontColor("Orange");
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout24);
    obj.rectangle32:setAlign("left");
    obj.rectangle32:setWidth(70);
    obj.rectangle32:setMargins({left=10});
    obj.rectangle32:setName("rectangle32");
    obj.rectangle32:setColor("transparent");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setXradius(10);
    obj.rectangle32:setYradius(10);
    obj.rectangle32:setCornerType("bevel");
    obj.rectangle32:setStrokeDash("dash");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle32);
    obj.edit18:setField("trainerAtk");
    obj.edit18:setTransparent(true);
    lfm_setPropAsString(obj.edit18, "fontStyle",  "bold");
    obj.edit18:setAlign("client");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setWidth(40);
    obj.edit18:setName("edit18");
    obj.edit18:setFontColor("White");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout24);
    obj.rectangle33:setAlign("left");
    obj.rectangle33:setWidth(70);
    obj.rectangle33:setMargins({left=10});
    obj.rectangle33:setName("rectangle33");
    obj.rectangle33:setColor("transparent");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setXradius(10);
    obj.rectangle33:setYradius(10);
    obj.rectangle33:setCornerType("bevel");
    obj.rectangle33:setStrokeDash("dash");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle33);
    obj.comboBox3:setField("trainerCmbtStgAtk");
    obj.comboBox3:setText("Escolha");
    obj.comboBox3:setAlign("client");
    obj.comboBox3:setTransparent(true);
    obj.comboBox3:setMargins({left=5,right=5});
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox3:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'});
    obj.comboBox3:setValue("6");
    obj.comboBox3:setFontColor("White");
    obj.comboBox3:setName("comboBox3");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout21);
    obj.button3:setAlign("left");
    obj.button3:setText("i");
    obj.button3:setWidth(20);
    obj.button3:setMargins({left=5});
    obj.button3:setName("button3");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.statsLine1);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(180);
    obj.layout25:setHeight(30);
    obj.layout25:setMargins({right=5});
    obj.layout25:setName("layout25");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout25);
    obj.label41:setText("Defense:");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setAlign("left");
    obj.label41:setMargins({left=10});
    obj.label41:setWidth(60);
    obj.label41:setName("label41");
    obj.label41:setFontColor("Moccasin");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout25);
    obj.rectangle34:setAlign("left");
    obj.rectangle34:setWidth(60);
    obj.rectangle34:setMargins({left=10});
    obj.rectangle34:setName("rectangle34");
    obj.rectangle34:setColor("transparent");
    obj.rectangle34:setStrokeColor("Orange");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setXradius(10);
    obj.rectangle34:setYradius(10);
    obj.rectangle34:setCornerType("innerRound");
    obj.rectangle34:setStrokeDash("dash");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle34);
    obj.label42:setField("trainerTotalDef");
    obj.label42:setAlign("client");
    obj.label42:setMargins({left=5,right=5});
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");
    obj.label42:setFontColor("Orange");
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");

    obj.defPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.defPopUp:setParent(obj.layout25);
    obj.defPopUp:setName("defPopUp");
    obj.defPopUp:setWidth(255);
    obj.defPopUp:setHeight(150);
    obj.defPopUp:setBackOpacity(0.5);

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.defPopUp);
    obj.label43:setText("DEFENSE");
    obj.label43:setAlign("top");
    obj.label43:setHeight(30);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");
    obj.label43:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setFontSize(18);

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.defPopUp);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(150);
    obj.layout26:setMargins({top=10});
    obj.layout26:setName("layout26");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(40);
    obj.layout27:setWidth(400);
    obj.layout27:setMargins({bottom=4});
    obj.layout27:setName("layout27");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout27);
    obj.label44:setText("Total");
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setWordWrap(true);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setAlign("left");
    obj.label44:setMargins({left=10});
    obj.label44:setWidth(70);
    obj.label44:setName("label44");
    obj.label44:setFontColor("Moccasin");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout27);
    obj.label45:setText("Valor");
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setWordWrap(true);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setAlign("left");
    obj.label45:setMargins({left=10});
    obj.label45:setWidth(70);
    obj.label45:setName("label45");
    obj.label45:setFontColor("Moccasin");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout27);
    obj.label46:setText("Stage Combat");
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");
    obj.label46:setWordWrap(true);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setAlign("left");
    obj.label46:setMargins({left=10});
    obj.label46:setWidth(70);
    obj.label46:setName("label46");
    obj.label46:setFontColor("Moccasin");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout26);
    obj.layout28:setAlign("top");
    obj.layout28:setMargins({bottom=4});
    obj.layout28:setName("layout28");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout28);
    obj.rectangle35:setAlign("left");
    obj.rectangle35:setWidth(70);
    obj.rectangle35:setMargins({left=10});
    obj.rectangle35:setName("rectangle35");
    obj.rectangle35:setColor("transparent");
    obj.rectangle35:setStrokeColor("Orange");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setXradius(10);
    obj.rectangle35:setYradius(10);
    obj.rectangle35:setCornerType("innerRound");
    obj.rectangle35:setStrokeDash("dash");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle35);
    obj.label47:setField("trainerTotalDef");
    obj.label47:setAlign("client");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setWidth(40);
    obj.label47:setName("label47");
    obj.label47:setFontColor("Orange");
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout28);
    obj.rectangle36:setAlign("left");
    obj.rectangle36:setWidth(70);
    obj.rectangle36:setMargins({left=10});
    obj.rectangle36:setName("rectangle36");
    obj.rectangle36:setColor("transparent");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setXradius(10);
    obj.rectangle36:setYradius(10);
    obj.rectangle36:setCornerType("bevel");
    obj.rectangle36:setStrokeDash("dash");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle36);
    obj.edit19:setField("trainerDef");
    obj.edit19:setTransparent(true);
    lfm_setPropAsString(obj.edit19, "fontStyle",  "bold");
    obj.edit19:setAlign("client");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setWidth(40);
    obj.edit19:setName("edit19");
    obj.edit19:setFontColor("White");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout28);
    obj.rectangle37:setAlign("left");
    obj.rectangle37:setWidth(70);
    obj.rectangle37:setMargins({left=10});
    obj.rectangle37:setName("rectangle37");
    obj.rectangle37:setColor("transparent");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setXradius(10);
    obj.rectangle37:setYradius(10);
    obj.rectangle37:setCornerType("bevel");
    obj.rectangle37:setStrokeDash("dash");

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.rectangle37);
    obj.comboBox4:setField("trainerCmbtStgDef");
    obj.comboBox4:setText("Escolha");
    obj.comboBox4:setAlign("client");
    obj.comboBox4:setTransparent(true);
    obj.comboBox4:setMargins({left=5,right=5});
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox4:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'});
    obj.comboBox4:setValue("6");
    obj.comboBox4:setFontColor("White");
    obj.comboBox4:setName("comboBox4");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout25);
    obj.button4:setAlign("left");
    obj.button4:setText("i");
    obj.button4:setWidth(20);
    obj.button4:setMargins({left=5});
    obj.button4:setName("button4");

    obj.statsLine2 = gui.fromHandle(_obj_newObject("layout"));
    obj.statsLine2:setParent(obj.rectangle25);
    obj.statsLine2:setName("statsLine2");
    obj.statsLine2:setAlign("top");
    obj.statsLine2:setMargins({top=10});

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.statsLine2);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(180);
    obj.layout29:setHeight(30);
    obj.layout29:setMargins({right=5});
    obj.layout29:setName("layout29");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout29);
    obj.label48:setText("Speed:");
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");
    obj.label48:setAlign("left");
    obj.label48:setMargins({left=10});
    obj.label48:setWidth(60);
    obj.label48:setName("label48");
    obj.label48:setFontColor("Moccasin");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout29);
    obj.rectangle38:setAlign("left");
    obj.rectangle38:setWidth(60);
    obj.rectangle38:setMargins({left=10});
    obj.rectangle38:setName("rectangle38");
    obj.rectangle38:setColor("transparent");
    obj.rectangle38:setStrokeColor("Orange");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setXradius(10);
    obj.rectangle38:setYradius(10);
    obj.rectangle38:setCornerType("innerRound");
    obj.rectangle38:setStrokeDash("dash");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle38);
    obj.label49:setField("trainerTotalSpeed");
    obj.label49:setAlign("client");
    obj.label49:setMargins({left=5,right=5});
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");
    obj.label49:setFontColor("Orange");
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");

    obj.spdPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.spdPopUp:setParent(obj.layout29);
    obj.spdPopUp:setName("spdPopUp");
    obj.spdPopUp:setWidth(255);
    obj.spdPopUp:setHeight(150);
    obj.spdPopUp:setBackOpacity(0.5);

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.spdPopUp);
    obj.label50:setText("SPEED");
    obj.label50:setAlign("top");
    obj.label50:setHeight(30);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");
    obj.label50:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setFontSize(18);

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.spdPopUp);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(150);
    obj.layout30:setMargins({top=10});
    obj.layout30:setName("layout30");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(40);
    obj.layout31:setWidth(400);
    obj.layout31:setMargins({bottom=4});
    obj.layout31:setName("layout31");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout31);
    obj.label51:setText("Total");
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setWordWrap(true);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setAlign("left");
    obj.label51:setMargins({left=10});
    obj.label51:setWidth(70);
    obj.label51:setName("label51");
    obj.label51:setFontColor("Moccasin");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout31);
    obj.label52:setText("Valor");
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setWordWrap(true);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setAlign("left");
    obj.label52:setMargins({left=10});
    obj.label52:setWidth(70);
    obj.label52:setName("label52");
    obj.label52:setFontColor("Moccasin");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout31);
    obj.label53:setText("Stage Combat");
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setWordWrap(true);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setAlign("left");
    obj.label53:setMargins({left=10});
    obj.label53:setWidth(70);
    obj.label53:setName("label53");
    obj.label53:setFontColor("Moccasin");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout30);
    obj.layout32:setAlign("top");
    obj.layout32:setMargins({bottom=4});
    obj.layout32:setName("layout32");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout32);
    obj.rectangle39:setAlign("left");
    obj.rectangle39:setWidth(70);
    obj.rectangle39:setMargins({left=10});
    obj.rectangle39:setName("rectangle39");
    obj.rectangle39:setColor("transparent");
    obj.rectangle39:setStrokeColor("Orange");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setXradius(10);
    obj.rectangle39:setYradius(10);
    obj.rectangle39:setCornerType("innerRound");
    obj.rectangle39:setStrokeDash("dash");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle39);
    obj.label54:setField("trainerTotalSpeed");
    obj.label54:setAlign("client");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setWidth(40);
    obj.label54:setName("label54");
    obj.label54:setFontColor("Orange");
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout32);
    obj.rectangle40:setAlign("left");
    obj.rectangle40:setWidth(70);
    obj.rectangle40:setMargins({left=10});
    obj.rectangle40:setName("rectangle40");
    obj.rectangle40:setColor("transparent");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setXradius(10);
    obj.rectangle40:setYradius(10);
    obj.rectangle40:setCornerType("bevel");
    obj.rectangle40:setStrokeDash("dash");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle40);
    obj.edit20:setField("trainerSpeed");
    obj.edit20:setTransparent(true);
    lfm_setPropAsString(obj.edit20, "fontStyle",  "bold");
    obj.edit20:setAlign("client");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setWidth(40);
    obj.edit20:setName("edit20");
    obj.edit20:setFontColor("White");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout32);
    obj.rectangle41:setAlign("left");
    obj.rectangle41:setWidth(70);
    obj.rectangle41:setMargins({left=10});
    obj.rectangle41:setName("rectangle41");
    obj.rectangle41:setColor("transparent");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setXradius(10);
    obj.rectangle41:setYradius(10);
    obj.rectangle41:setCornerType("bevel");
    obj.rectangle41:setStrokeDash("dash");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.rectangle41);
    obj.comboBox5:setField("trainerCmbtStgSpeed");
    obj.comboBox5:setText("Escolha");
    obj.comboBox5:setAlign("client");
    obj.comboBox5:setTransparent(true);
    obj.comboBox5:setMargins({left=5,right=5});
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox5:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'});
    obj.comboBox5:setValue("6");
    obj.comboBox5:setFontColor("White");
    obj.comboBox5:setName("comboBox5");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout29);
    obj.button5:setAlign("left");
    obj.button5:setText("i");
    obj.button5:setWidth(20);
    obj.button5:setMargins({left=5});
    obj.button5:setName("button5");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.statsLine2);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(180);
    obj.layout33:setHeight(30);
    obj.layout33:setMargins({right=5});
    obj.layout33:setName("layout33");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout33);
    obj.label55:setText("Sp. Attack:");
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setAlign("left");
    obj.label55:setMargins({left=10});
    obj.label55:setWidth(60);
    obj.label55:setName("label55");
    obj.label55:setFontColor("Moccasin");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout33);
    obj.rectangle42:setAlign("left");
    obj.rectangle42:setWidth(60);
    obj.rectangle42:setMargins({left=10});
    obj.rectangle42:setName("rectangle42");
    obj.rectangle42:setColor("transparent");
    obj.rectangle42:setStrokeColor("Orange");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setXradius(10);
    obj.rectangle42:setYradius(10);
    obj.rectangle42:setCornerType("innerRound");
    obj.rectangle42:setStrokeDash("dash");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle42);
    obj.label56:setField("trainerTotalSpAtk");
    obj.label56:setAlign("client");
    obj.label56:setMargins({left=5,right=5});
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");
    obj.label56:setFontColor("Orange");
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");

    obj.spAtkPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.spAtkPopUp:setParent(obj.layout33);
    obj.spAtkPopUp:setName("spAtkPopUp");
    obj.spAtkPopUp:setWidth(255);
    obj.spAtkPopUp:setHeight(150);
    obj.spAtkPopUp:setBackOpacity(0.5);

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.spAtkPopUp);
    obj.label57:setText("SPECIAL ATTACK");
    obj.label57:setAlign("top");
    obj.label57:setHeight(30);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");
    obj.label57:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label57, "fontStyle",  "bold");
    obj.label57:setFontSize(18);

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.spAtkPopUp);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(150);
    obj.layout34:setMargins({top=10});
    obj.layout34:setName("layout34");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout34);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(40);
    obj.layout35:setWidth(400);
    obj.layout35:setMargins({bottom=4});
    obj.layout35:setName("layout35");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout35);
    obj.label58:setText("Total");
    lfm_setPropAsString(obj.label58, "fontStyle",  "bold");
    obj.label58:setWordWrap(true);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setAlign("left");
    obj.label58:setMargins({left=10});
    obj.label58:setWidth(70);
    obj.label58:setName("label58");
    obj.label58:setFontColor("Moccasin");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout35);
    obj.label59:setText("Valor");
    lfm_setPropAsString(obj.label59, "fontStyle",  "bold");
    obj.label59:setWordWrap(true);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setAlign("left");
    obj.label59:setMargins({left=10});
    obj.label59:setWidth(70);
    obj.label59:setName("label59");
    obj.label59:setFontColor("Moccasin");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout35);
    obj.label60:setText("Stage Combat");
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");
    obj.label60:setWordWrap(true);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setAlign("left");
    obj.label60:setMargins({left=10});
    obj.label60:setWidth(70);
    obj.label60:setName("label60");
    obj.label60:setFontColor("Moccasin");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout34);
    obj.layout36:setAlign("top");
    obj.layout36:setMargins({bottom=4});
    obj.layout36:setName("layout36");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout36);
    obj.rectangle43:setAlign("left");
    obj.rectangle43:setWidth(70);
    obj.rectangle43:setMargins({left=10});
    obj.rectangle43:setName("rectangle43");
    obj.rectangle43:setColor("transparent");
    obj.rectangle43:setStrokeColor("Orange");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setXradius(10);
    obj.rectangle43:setYradius(10);
    obj.rectangle43:setCornerType("innerRound");
    obj.rectangle43:setStrokeDash("dash");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle43);
    obj.label61:setField("trainerTotalSpAtk");
    obj.label61:setAlign("client");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setWidth(40);
    obj.label61:setName("label61");
    obj.label61:setFontColor("Orange");
    lfm_setPropAsString(obj.label61, "fontStyle",  "bold");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout36);
    obj.rectangle44:setAlign("left");
    obj.rectangle44:setWidth(70);
    obj.rectangle44:setMargins({left=10});
    obj.rectangle44:setName("rectangle44");
    obj.rectangle44:setColor("transparent");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setXradius(10);
    obj.rectangle44:setYradius(10);
    obj.rectangle44:setCornerType("bevel");
    obj.rectangle44:setStrokeDash("dash");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle44);
    obj.edit21:setField("trainerSpAtk");
    obj.edit21:setTransparent(true);
    lfm_setPropAsString(obj.edit21, "fontStyle",  "bold");
    obj.edit21:setAlign("client");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setWidth(40);
    obj.edit21:setName("edit21");
    obj.edit21:setFontColor("White");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout36);
    obj.rectangle45:setAlign("left");
    obj.rectangle45:setWidth(70);
    obj.rectangle45:setMargins({left=10});
    obj.rectangle45:setName("rectangle45");
    obj.rectangle45:setColor("transparent");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setXradius(10);
    obj.rectangle45:setYradius(10);
    obj.rectangle45:setCornerType("bevel");
    obj.rectangle45:setStrokeDash("dash");

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.rectangle45);
    obj.comboBox6:setField("trainerCmbtStgSpAtk");
    obj.comboBox6:setText("Escolha");
    obj.comboBox6:setAlign("client");
    obj.comboBox6:setTransparent(true);
    obj.comboBox6:setMargins({left=5,right=5});
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox6:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'});
    obj.comboBox6:setValue("6");
    obj.comboBox6:setFontColor("White");
    obj.comboBox6:setName("comboBox6");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout33);
    obj.button6:setAlign("left");
    obj.button6:setText("i");
    obj.button6:setWidth(20);
    obj.button6:setMargins({left=5});
    obj.button6:setName("button6");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.statsLine2);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(180);
    obj.layout37:setHeight(30);
    obj.layout37:setMargins({right=5});
    obj.layout37:setName("layout37");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout37);
    obj.label62:setText("Sp. Defense:");
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");
    obj.label62:setAlign("left");
    obj.label62:setMargins({left=10});
    obj.label62:setWidth(60);
    obj.label62:setName("label62");
    obj.label62:setFontColor("Moccasin");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout37);
    obj.rectangle46:setAlign("left");
    obj.rectangle46:setWidth(60);
    obj.rectangle46:setMargins({left=10});
    obj.rectangle46:setName("rectangle46");
    obj.rectangle46:setColor("transparent");
    obj.rectangle46:setStrokeColor("Orange");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setXradius(10);
    obj.rectangle46:setYradius(10);
    obj.rectangle46:setCornerType("innerRound");
    obj.rectangle46:setStrokeDash("dash");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle46);
    obj.label63:setField("trainerTotalSpDef");
    obj.label63:setAlign("client");
    obj.label63:setMargins({left=5,right=5});
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");
    obj.label63:setFontColor("Orange");
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");

    obj.spDefPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.spDefPopUp:setParent(obj.layout37);
    obj.spDefPopUp:setName("spDefPopUp");
    obj.spDefPopUp:setWidth(255);
    obj.spDefPopUp:setHeight(150);
    obj.spDefPopUp:setBackOpacity(0.5);

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.spDefPopUp);
    obj.label64:setText("SPECIAL DEFENSE");
    obj.label64:setAlign("top");
    obj.label64:setHeight(30);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");
    obj.label64:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");
    obj.label64:setFontSize(18);

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.spDefPopUp);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(150);
    obj.layout38:setMargins({top=10});
    obj.layout38:setName("layout38");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(40);
    obj.layout39:setWidth(400);
    obj.layout39:setMargins({bottom=4});
    obj.layout39:setName("layout39");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout39);
    obj.label65:setText("Total");
    lfm_setPropAsString(obj.label65, "fontStyle",  "bold");
    obj.label65:setWordWrap(true);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setAlign("left");
    obj.label65:setMargins({left=10});
    obj.label65:setWidth(70);
    obj.label65:setName("label65");
    obj.label65:setFontColor("Moccasin");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout39);
    obj.label66:setText("Valor");
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");
    obj.label66:setWordWrap(true);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setAlign("left");
    obj.label66:setMargins({left=10});
    obj.label66:setWidth(70);
    obj.label66:setName("label66");
    obj.label66:setFontColor("Moccasin");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout39);
    obj.label67:setText("Stage Combat");
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setWordWrap(true);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setAlign("left");
    obj.label67:setMargins({left=10});
    obj.label67:setWidth(70);
    obj.label67:setName("label67");
    obj.label67:setFontColor("Moccasin");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout38);
    obj.layout40:setAlign("top");
    obj.layout40:setMargins({bottom=4});
    obj.layout40:setName("layout40");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout40);
    obj.rectangle47:setAlign("left");
    obj.rectangle47:setWidth(70);
    obj.rectangle47:setMargins({left=10});
    obj.rectangle47:setName("rectangle47");
    obj.rectangle47:setColor("transparent");
    obj.rectangle47:setStrokeColor("Orange");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setXradius(10);
    obj.rectangle47:setYradius(10);
    obj.rectangle47:setCornerType("innerRound");
    obj.rectangle47:setStrokeDash("dash");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle47);
    obj.label68:setField("trainerTotalSpDef");
    obj.label68:setAlign("client");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setWidth(40);
    obj.label68:setName("label68");
    obj.label68:setFontColor("Orange");
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout40);
    obj.rectangle48:setAlign("left");
    obj.rectangle48:setWidth(70);
    obj.rectangle48:setMargins({left=10});
    obj.rectangle48:setName("rectangle48");
    obj.rectangle48:setColor("transparent");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setXradius(10);
    obj.rectangle48:setYradius(10);
    obj.rectangle48:setCornerType("bevel");
    obj.rectangle48:setStrokeDash("dash");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle48);
    obj.edit22:setField("trainerSpDef");
    obj.edit22:setTransparent(true);
    lfm_setPropAsString(obj.edit22, "fontStyle",  "bold");
    obj.edit22:setAlign("client");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setWidth(40);
    obj.edit22:setName("edit22");
    obj.edit22:setFontColor("White");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout40);
    obj.rectangle49:setAlign("left");
    obj.rectangle49:setWidth(70);
    obj.rectangle49:setMargins({left=10});
    obj.rectangle49:setName("rectangle49");
    obj.rectangle49:setColor("transparent");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setXradius(10);
    obj.rectangle49:setYradius(10);
    obj.rectangle49:setCornerType("bevel");
    obj.rectangle49:setStrokeDash("dash");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.rectangle49);
    obj.comboBox7:setField("trainerCmbtStgSpDef");
    obj.comboBox7:setText("Escolha");
    obj.comboBox7:setAlign("client");
    obj.comboBox7:setTransparent(true);
    obj.comboBox7:setMargins({left=5,right=5});
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox7:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'});
    obj.comboBox7:setValue("6");
    obj.comboBox7:setFontColor("White");
    obj.comboBox7:setName("comboBox7");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout37);
    obj.button7:setAlign("left");
    obj.button7:setText("i");
    obj.button7:setWidth(20);
    obj.button7:setMargins({left=5});
    obj.button7:setName("button7");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.statsLine2);
    obj.layout41:setAlign("client");
    obj.layout41:setMargins({top=120, right=140, bottom=140});
    obj.layout41:setName("layout41");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout41);
    obj.label69:setText("Ev.Fis.:");
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setAlign("left");
    obj.label69:setWidth(50);
    obj.label69:setName("label69");
    obj.label69:setFontColor("Moccasin");

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout41);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("transparent");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setXradius(10);
    obj.rectangle50:setYradius(10);
    obj.rectangle50:setCornerType("bevel");
    obj.rectangle50:setStrokeDash("dash");
    obj.rectangle50:setMargins({left=5, right=2});
    obj.rectangle50:setName("rectangle50");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle50);
    obj.label70:setField("trainerEvasion");
    obj.label70:setAlign("client");
    obj.label70:setMargins({left=5, right=5});
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");
    obj.label70:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.statsLine2);
    obj.layout42:setAlign("client");
    obj.layout42:setMargins({left=140, top=120, bottom=140});
    obj.layout42:setName("layout42");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout42);
    obj.label71:setText("Ev.Esp.:");
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");
    obj.label71:setAlign("left");
    obj.label71:setWidth(50);
    obj.label71:setName("label71");
    obj.label71:setFontColor("Moccasin");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout42);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("transparent");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setXradius(10);
    obj.rectangle51:setYradius(10);
    obj.rectangle51:setCornerType("bevel");
    obj.rectangle51:setStrokeDash("dash");
    obj.rectangle51:setMargins({left=5, right=2});
    obj.rectangle51:setName("rectangle51");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle51);
    obj.label72:setField("trainerSpEvasion");
    obj.label72:setAlign("client");
    obj.label72:setMargins({left=5, right=5});
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");
    obj.label72:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.statsLine2);
    obj.layout43:setAlign("client");
    obj.layout43:setMargins({left=70, top=160, right=70, bottom=100});
    obj.layout43:setName("layout43");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout43);
    obj.label73:setText("Ev.Vel.:");
    lfm_setPropAsString(obj.label73, "fontStyle",  "bold");
    obj.label73:setAlign("left");
    obj.label73:setWidth(50);
    obj.label73:setMargins({left=1});
    obj.label73:setName("label73");
    obj.label73:setFontColor("Moccasin");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout43);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("transparent");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setXradius(10);
    obj.rectangle52:setYradius(10);
    obj.rectangle52:setCornerType("bevel");
    obj.rectangle52:setStrokeDash("dash");
    obj.rectangle52:setMargins({left=5, right=2});
    obj.rectangle52:setName("rectangle52");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle52);
    obj.label74:setField("trainerSpeedEvasion");
    obj.label74:setAlign("client");
    obj.label74:setMargins({left=5, right=5});
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");
    obj.label74:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.statsLine2);
    obj.layout44:setAlign("client");
    obj.layout44:setMargins({top=200,bottom=10});
    obj.layout44:setName("layout44");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout44);
    obj.label75:setText("Habilidades:");
    obj.label75:setFontSize(10);
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold");
    obj.label75:setAlign("left");
    obj.label75:setWidth(60);
    obj.label75:setMargins({left=1});
    obj.label75:setVertTextAlign("center");
    obj.label75:setName("label75");
    obj.label75:setFontColor("Moccasin");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout44);
    obj.rectangle53:setAlign("client");
    obj.rectangle53:setColor("transparent");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setXradius(5);
    obj.rectangle53:setYradius(5);
    obj.rectangle53:setCornerType("bevel");
    obj.rectangle53:setStrokeDash("dash");
    obj.rectangle53:setMargins({left=10, right=1});
    obj.rectangle53:setName("rectangle53");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle53);
    obj.textEditor4:setField("trainerAbilities");
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setMargins({left=5, right=5});
    obj.textEditor4:setHorzTextAlign("leading");
    obj.textEditor4:setName("textEditor4");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle22);
    obj.layout45:setAlign("top");
    obj.layout45:setWidth(600);
    obj.layout45:setHeight(60);
    obj.layout45:setMargins({top=10});
    obj.layout45:setName("layout45");

    obj.rectangle54 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout45);
    obj.rectangle54:setAlign("client");
    obj.rectangle54:setWidth(60);
    obj.rectangle54:setMargins({left=5, right=5});
    obj.rectangle54:setName("rectangle54");
    obj.rectangle54:setColor("transparent");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setXradius(10);
    obj.rectangle54:setYradius(10);
    obj.rectangle54:setCornerType("bevel");
    obj.rectangle54:setStrokeDash("dash");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle54);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(190);
    obj.layout46:setMargins({top=5, bottom=5});
    obj.layout46:setName("layout46");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout46);
    obj.label76:setText("Evasão Física:");
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setAlign("left");
    obj.label76:setWordWrap(true);
    obj.label76:setMargins({left=10});
    obj.label76:setWidth(80);
    obj.label76:setName("label76");
    obj.label76:setFontColor("Moccasin");

    obj.rectangle55 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout46);
    obj.rectangle55:setAlign("left");
    obj.rectangle55:setWidth(60);
    obj.rectangle55:setMargins({left=5});
    obj.rectangle55:setName("rectangle55");
    obj.rectangle55:setColor("transparent");
    obj.rectangle55:setStrokeColor("Orange");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setXradius(10);
    obj.rectangle55:setYradius(10);
    obj.rectangle55:setCornerType("innerRound");
    obj.rectangle55:setStrokeDash("dash");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle55);
    obj.label77:setField("trainerEvasion");
    obj.label77:setAlign("client");
    obj.label77:setMargins({left=5,right=5});
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");
    obj.label77:setFontColor("Orange");
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle54);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(190);
    obj.layout47:setMargins({top=5, bottom=5});
    obj.layout47:setName("layout47");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout47);
    obj.label78:setText("Evasão Especial:");
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");
    obj.label78:setAlign("left");
    obj.label78:setWordWrap(true);
    obj.label78:setMargins({left=30});
    obj.label78:setWidth(80);
    obj.label78:setName("label78");
    obj.label78:setFontColor("Moccasin");

    obj.rectangle56 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout47);
    obj.rectangle56:setAlign("left");
    obj.rectangle56:setWidth(60);
    obj.rectangle56:setMargins({left=5});
    obj.rectangle56:setName("rectangle56");
    obj.rectangle56:setColor("transparent");
    obj.rectangle56:setStrokeColor("Orange");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setXradius(10);
    obj.rectangle56:setYradius(10);
    obj.rectangle56:setCornerType("innerRound");
    obj.rectangle56:setStrokeDash("dash");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.rectangle56);
    obj.label79:setField("trainerSpEvasion");
    obj.label79:setAlign("client");
    obj.label79:setMargins({left=5,right=5});
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");
    obj.label79:setFontColor("Orange");
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle54);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(190);
    obj.layout48:setMargins({top=5, bottom=5});
    obj.layout48:setName("layout48");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout48);
    obj.label80:setText("Evasão de Velocidade:");
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setAlign("left");
    obj.label80:setWordWrap(true);
    obj.label80:setMargins({left=30});
    obj.label80:setWidth(80);
    obj.label80:setName("label80");
    obj.label80:setFontColor("Moccasin");

    obj.rectangle57 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout48);
    obj.rectangle57:setAlign("left");
    obj.rectangle57:setWidth(60);
    obj.rectangle57:setMargins({left=5});
    obj.rectangle57:setName("rectangle57");
    obj.rectangle57:setColor("transparent");
    obj.rectangle57:setStrokeColor("Orange");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setXradius(10);
    obj.rectangle57:setYradius(10);
    obj.rectangle57:setCornerType("innerRound");
    obj.rectangle57:setStrokeDash("dash");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.rectangle57);
    obj.label81:setField("trainerSpeedEvasion");
    obj.label81:setAlign("client");
    obj.label81:setMargins({left=5,right=5});
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");
    obj.label81:setFontColor("Orange");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle22);
    obj.layout49:setAlign("top");
    obj.layout49:setWidth(600);
    obj.layout49:setHeight(60);
    obj.layout49:setMargins({top=10});
    obj.layout49:setName("layout49");

    obj.rectangle58 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout49);
    obj.rectangle58:setAlign("client");
    obj.rectangle58:setWidth(60);
    obj.rectangle58:setMargins({left=5, right=5});
    obj.rectangle58:setName("rectangle58");
    obj.rectangle58:setColor("transparent");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setXradius(10);
    obj.rectangle58:setYradius(10);
    obj.rectangle58:setCornerType("bevel");
    obj.rectangle58:setStrokeDash("dash");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle58);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(190);
    obj.layout50:setMargins({top=5, bottom=5});
    obj.layout50:setName("layout50");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout50);
    obj.label82:setText("Iniciativa:");
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");
    obj.label82:setAlign("left");
    obj.label82:setWordWrap(true);
    obj.label82:setMargins({left=10});
    obj.label82:setWidth(80);
    obj.label82:setName("label82");
    obj.label82:setFontColor("Moccasin");

    obj.rectangle59 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout50);
    obj.rectangle59:setAlign("left");
    obj.rectangle59:setWidth(60);
    obj.rectangle59:setMargins({left=5});
    obj.rectangle59:setName("rectangle59");
    obj.rectangle59:setColor("transparent");
    obj.rectangle59:setStrokeColor("Orange");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setXradius(10);
    obj.rectangle59:setYradius(10);
    obj.rectangle59:setCornerType("innerRound");
    obj.rectangle59:setStrokeDash("dash");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.rectangle59);
    obj.label83:setField("trainerInitiative");
    obj.label83:setAlign("client");
    obj.label83:setMargins({left=5,right=5});
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");
    obj.label83:setFontColor("Orange");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle58);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(190);
    obj.layout51:setMargins({top=5, bottom=5});
    obj.layout51:setName("layout51");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout51);
    obj.label84:setText("Atk. Dano Físico:");
    lfm_setPropAsString(obj.label84, "fontStyle",  "bold");
    obj.label84:setAlign("left");
    obj.label84:setWordWrap(true);
    obj.label84:setMargins({left=30});
    obj.label84:setWidth(80);
    obj.label84:setName("label84");
    obj.label84:setFontColor("Moccasin");

    obj.rectangle60 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout51);
    obj.rectangle60:setAlign("left");
    obj.rectangle60:setWidth(60);
    obj.rectangle60:setMargins({left=5});
    obj.rectangle60:setName("rectangle60");
    obj.rectangle60:setColor("transparent");
    obj.rectangle60:setStrokeColor("Orange");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setXradius(10);
    obj.rectangle60:setYradius(10);
    obj.rectangle60:setCornerType("innerRound");
    obj.rectangle60:setStrokeDash("dash");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle60);
    obj.label85:setField("trainerDamagePhysical");
    obj.label85:setAlign("client");
    obj.label85:setMargins({left=5,right=5});
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");
    obj.label85:setFontColor("Orange");
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle58);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(190);
    obj.layout52:setMargins({top=5, bottom=5});
    obj.layout52:setName("layout52");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout52);
    obj.label86:setText("Atk. Dano Especial:");
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setAlign("left");
    obj.label86:setWordWrap(true);
    obj.label86:setMargins({left=30});
    obj.label86:setWidth(80);
    obj.label86:setName("label86");
    obj.label86:setFontColor("Moccasin");

    obj.rectangle61 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout52);
    obj.rectangle61:setAlign("left");
    obj.rectangle61:setWidth(60);
    obj.rectangle61:setMargins({left=5});
    obj.rectangle61:setName("rectangle61");
    obj.rectangle61:setColor("transparent");
    obj.rectangle61:setStrokeColor("Orange");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setXradius(10);
    obj.rectangle61:setYradius(10);
    obj.rectangle61:setCornerType("innerRound");
    obj.rectangle61:setStrokeDash("dash");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.rectangle61);
    obj.label87:setField("trainerDamageSpecial");
    obj.label87:setAlign("client");
    obj.label87:setMargins({left=5,right=5});
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");
    obj.label87:setFontColor("Orange");
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Skills");
    obj.tab2:setName("tab2");

    obj.firstStatRow = gui.fromHandle(_obj_newObject("layout"));
    obj.firstStatRow:setParent(obj.tab2);
    obj.firstStatRow:setName("firstStatRow");
    obj.firstStatRow:setAlign("top");
    obj.firstStatRow:setHeight(310);
    obj.firstStatRow:setMargins({top=8, bottom=310});

    obj.bodySection = gui.fromHandle(_obj_newObject("layout"));
    obj.bodySection:setParent(obj.firstStatRow);
    obj.bodySection:setName("bodySection");
    obj.bodySection:setAlign("right");
    obj.bodySection:setWidth(280);
    obj.bodySection:setMargins({right=15});

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.bodySection);
    obj.layout53:setAlign("client");
    obj.layout53:setMargins({top=10,bottom=10});
    obj.layout53:setName("layout53");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout53);
    obj.label88:setText("CORPO");
    lfm_setPropAsString(obj.label88, "fontStyle",  "bold");
    obj.label88:setAlign("top");
    obj.label88:setWidth(60);
    obj.label88:setMargins({left=1});
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");
    obj.label88:setFontColor("Moccasin");

    obj.rectangle62 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout53);
    obj.rectangle62:setAlign("client");
    obj.rectangle62:setColor("transparent");
    obj.rectangle62:setStrokeColor("white");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setXradius(10);
    obj.rectangle62:setYradius(10);
    obj.rectangle62:setCornerType("round");
    obj.rectangle62:setStrokeDash("dash");
    obj.rectangle62:setMargins({left=10, top=5, right=1});
    obj.rectangle62:setName("rectangle62");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle62);
    obj.layout54:setAlign("client");
    obj.layout54:setMargins({top=25, bottom=220});
    obj.layout54:setName("layout54");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout54);
    obj.label89:setText("Acrobacia:");
    obj.label89:setWordWrap(true);
    lfm_setPropAsString(obj.label89, "fontStyle",  "bold");
    obj.label89:setAlign("left");
    obj.label89:setWidth(70);
    obj.label89:setMargins({left=10});
    obj.label89:setName("label89");
    obj.label89:setFontColor("Moccasin");

    obj.rectangle63 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout54);
    obj.rectangle63:setAlign("client");
    obj.rectangle63:setColor("transparent");
    obj.rectangle63:setStrokeColor("white");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setXradius(10);
    obj.rectangle63:setYradius(10);
    obj.rectangle63:setCornerType("bevel");
    obj.rectangle63:setStrokeDash("dash");
    obj.rectangle63:setMargins({left=3, right=5});
    obj.rectangle63:setName("rectangle63");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.rectangle63);
    obj.label90:setField("bodyAcroDice");
    lfm_setPropAsString(obj.label90, "fontStyle",  "bold");
    obj.label90:setAlign("client");
    obj.label90:setMargins({left=105, right=10});
    obj.label90:setHorzTextAlign("trailing");
    obj.label90:setName("label90");
    obj.label90:setFontColor("Moccasin");

    obj.comboBox8 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.rectangle63);
    obj.comboBox8:setField("bodyAcroLevel");
    obj.comboBox8:setText("Destreinado");
    obj.comboBox8:setAlign("client");
    obj.comboBox8:setTransparent(true);
    obj.comboBox8:setMargins({left=5,right=55});
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox8:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox8:setFontColor("White");
    obj.comboBox8:setName("comboBox8");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle62);
    obj.layout55:setAlign("client");
    obj.layout55:setMargins({top=65, bottom=180});
    obj.layout55:setName("layout55");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout55);
    obj.label91:setText("Atletismo:");
    obj.label91:setWordWrap(true);
    lfm_setPropAsString(obj.label91, "fontStyle",  "bold");
    obj.label91:setAlign("left");
    obj.label91:setWidth(70);
    obj.label91:setMargins({left=10});
    obj.label91:setName("label91");
    obj.label91:setFontColor("Moccasin");

    obj.rectangle64 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout55);
    obj.rectangle64:setAlign("client");
    obj.rectangle64:setColor("transparent");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setXradius(10);
    obj.rectangle64:setYradius(10);
    obj.rectangle64:setCornerType("bevel");
    obj.rectangle64:setStrokeDash("dash");
    obj.rectangle64:setMargins({left=3, right=5});
    obj.rectangle64:setName("rectangle64");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.rectangle64);
    obj.label92:setField("bodyAthleticsDice");
    lfm_setPropAsString(obj.label92, "fontStyle",  "bold");
    obj.label92:setAlign("client");
    obj.label92:setMargins({left=105, right=10});
    obj.label92:setHorzTextAlign("trailing");
    obj.label92:setName("label92");
    obj.label92:setFontColor("Moccasin");

    obj.comboBox9 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.rectangle64);
    obj.comboBox9:setField("bodyAthleticsLevel");
    obj.comboBox9:setText("Destreinado");
    obj.comboBox9:setAlign("client");
    obj.comboBox9:setTransparent(true);
    obj.comboBox9:setMargins({left=5,right=55});
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox9:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox9:setFontColor("White");
    obj.comboBox9:setName("comboBox9");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle62);
    obj.layout56:setAlign("client");
    obj.layout56:setMargins({top=105, bottom=140});
    obj.layout56:setName("layout56");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout56);
    obj.label93:setText("Combate:");
    obj.label93:setWordWrap(true);
    lfm_setPropAsString(obj.label93, "fontStyle",  "bold");
    obj.label93:setAlign("left");
    obj.label93:setWidth(70);
    obj.label93:setMargins({left=10});
    obj.label93:setName("label93");
    obj.label93:setFontColor("Moccasin");

    obj.rectangle65 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout56);
    obj.rectangle65:setAlign("client");
    obj.rectangle65:setColor("transparent");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setXradius(10);
    obj.rectangle65:setYradius(10);
    obj.rectangle65:setCornerType("bevel");
    obj.rectangle65:setStrokeDash("dash");
    obj.rectangle65:setMargins({left=3, right=5});
    obj.rectangle65:setName("rectangle65");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.rectangle65);
    obj.label94:setField("bodyCombatDice");
    lfm_setPropAsString(obj.label94, "fontStyle",  "bold");
    obj.label94:setAlign("client");
    obj.label94:setMargins({left=105, right=10});
    obj.label94:setHorzTextAlign("trailing");
    obj.label94:setName("label94");
    obj.label94:setFontColor("Moccasin");

    obj.comboBox10 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.rectangle65);
    obj.comboBox10:setField("bodyCombatLevel");
    obj.comboBox10:setText("Destreinado");
    obj.comboBox10:setAlign("client");
    obj.comboBox10:setTransparent(true);
    obj.comboBox10:setMargins({left=5,right=55});
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox10:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox10:setFontColor("White");
    obj.comboBox10:setName("comboBox10");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle62);
    obj.layout57:setAlign("client");
    obj.layout57:setMargins({top=145, bottom=100});
    obj.layout57:setName("layout57");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout57);
    obj.label95:setText("Furtividade:");
    obj.label95:setWordWrap(true);
    lfm_setPropAsString(obj.label95, "fontStyle",  "bold");
    obj.label95:setAlign("left");
    obj.label95:setWidth(70);
    obj.label95:setMargins({left=10});
    obj.label95:setName("label95");
    obj.label95:setFontColor("Moccasin");

    obj.rectangle66 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout57);
    obj.rectangle66:setAlign("client");
    obj.rectangle66:setColor("transparent");
    obj.rectangle66:setStrokeColor("white");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setXradius(10);
    obj.rectangle66:setYradius(10);
    obj.rectangle66:setCornerType("bevel");
    obj.rectangle66:setStrokeDash("dash");
    obj.rectangle66:setMargins({left=3, right=5});
    obj.rectangle66:setName("rectangle66");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.rectangle66);
    obj.label96:setField("bodyStealthDice");
    lfm_setPropAsString(obj.label96, "fontStyle",  "bold");
    obj.label96:setAlign("client");
    obj.label96:setMargins({left=105, right=10});
    obj.label96:setHorzTextAlign("trailing");
    obj.label96:setName("label96");
    obj.label96:setFontColor("Moccasin");

    obj.comboBox11 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.rectangle66);
    obj.comboBox11:setField("bodyStealthLevel");
    obj.comboBox11:setText("Destreinado");
    obj.comboBox11:setAlign("client");
    obj.comboBox11:setTransparent(true);
    obj.comboBox11:setMargins({left=5,right=55});
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox11:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox11:setFontColor("White");
    obj.comboBox11:setName("comboBox11");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle62);
    obj.layout58:setAlign("client");
    obj.layout58:setMargins({top=185, bottom=60});
    obj.layout58:setName("layout58");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout58);
    obj.label97:setText("Intimidar:");
    obj.label97:setWordWrap(true);
    lfm_setPropAsString(obj.label97, "fontStyle",  "bold");
    obj.label97:setAlign("left");
    obj.label97:setWidth(70);
    obj.label97:setMargins({left=10});
    obj.label97:setName("label97");
    obj.label97:setFontColor("Moccasin");

    obj.rectangle67 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout58);
    obj.rectangle67:setAlign("client");
    obj.rectangle67:setColor("transparent");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setXradius(10);
    obj.rectangle67:setYradius(10);
    obj.rectangle67:setCornerType("bevel");
    obj.rectangle67:setStrokeDash("dash");
    obj.rectangle67:setMargins({left=3, right=5});
    obj.rectangle67:setName("rectangle67");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.rectangle67);
    obj.label98:setField("bodyIntimidateDice");
    lfm_setPropAsString(obj.label98, "fontStyle",  "bold");
    obj.label98:setAlign("client");
    obj.label98:setMargins({left=105, right=10});
    obj.label98:setHorzTextAlign("trailing");
    obj.label98:setName("label98");
    obj.label98:setFontColor("Moccasin");

    obj.comboBox12 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.rectangle67);
    obj.comboBox12:setField("bodyIntimidateLevel");
    obj.comboBox12:setText("Destreinado");
    obj.comboBox12:setAlign("client");
    obj.comboBox12:setTransparent(true);
    obj.comboBox12:setMargins({left=5,right=55});
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox12:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox12:setFontColor("White");
    obj.comboBox12:setName("comboBox12");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle62);
    obj.layout59:setAlign("client");
    obj.layout59:setMargins({top=225, bottom=20});
    obj.layout59:setName("layout59");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout59);
    obj.label99:setText("Sobreviv.:");
    obj.label99:setWordWrap(true);
    lfm_setPropAsString(obj.label99, "fontStyle",  "bold");
    obj.label99:setAlign("left");
    obj.label99:setWidth(70);
    obj.label99:setMargins({left=10});
    obj.label99:setName("label99");
    obj.label99:setFontColor("Moccasin");

    obj.rectangle68 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout59);
    obj.rectangle68:setAlign("client");
    obj.rectangle68:setColor("transparent");
    obj.rectangle68:setStrokeColor("white");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setXradius(10);
    obj.rectangle68:setYradius(10);
    obj.rectangle68:setCornerType("bevel");
    obj.rectangle68:setStrokeDash("dash");
    obj.rectangle68:setMargins({left=3, right=5});
    obj.rectangle68:setName("rectangle68");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.rectangle68);
    obj.label100:setField("bodySurvivalDice");
    lfm_setPropAsString(obj.label100, "fontStyle",  "bold");
    obj.label100:setAlign("client");
    obj.label100:setMargins({left=105, right=10});
    obj.label100:setHorzTextAlign("trailing");
    obj.label100:setName("label100");
    obj.label100:setFontColor("Moccasin");

    obj.comboBox13 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.rectangle68);
    obj.comboBox13:setField("bodySurvivalLevel");
    obj.comboBox13:setText("Destreinado");
    obj.comboBox13:setAlign("client");
    obj.comboBox13:setTransparent(true);
    obj.comboBox13:setMargins({left=5,right=55});
    obj.comboBox13:setHorzTextAlign("center");
    obj.comboBox13:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox13:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox13:setFontColor("White");
    obj.comboBox13:setName("comboBox13");

    obj.spiritSection = gui.fromHandle(_obj_newObject("layout"));
    obj.spiritSection:setParent(obj.firstStatRow);
    obj.spiritSection:setName("spiritSection");
    obj.spiritSection:setAlign("right");
    obj.spiritSection:setWidth(280);
    obj.spiritSection:setMargins({right=15});

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.spiritSection);
    obj.layout60:setAlign("client");
    obj.layout60:setMargins({top=10,bottom=10});
    obj.layout60:setName("layout60");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout60);
    obj.label101:setText("ESPÍRITO");
    lfm_setPropAsString(obj.label101, "fontStyle",  "bold");
    obj.label101:setAlign("top");
    obj.label101:setWidth(60);
    obj.label101:setMargins({left=1});
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");
    obj.label101:setFontColor("Moccasin");

    obj.rectangle69 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout60);
    obj.rectangle69:setAlign("client");
    obj.rectangle69:setColor("transparent");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setXradius(10);
    obj.rectangle69:setYradius(10);
    obj.rectangle69:setCornerType("round");
    obj.rectangle69:setStrokeDash("dash");
    obj.rectangle69:setMargins({left=10, top=5, right=1});
    obj.rectangle69:setName("rectangle69");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle69);
    obj.layout61:setAlign("client");
    obj.layout61:setMargins({top=35, bottom=210});
    obj.layout61:setName("layout61");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout61);
    obj.label102:setText("Charme:");
    obj.label102:setWordWrap(true);
    lfm_setPropAsString(obj.label102, "fontStyle",  "bold");
    obj.label102:setAlign("left");
    obj.label102:setWidth(70);
    obj.label102:setMargins({left=10});
    obj.label102:setName("label102");
    obj.label102:setFontColor("Moccasin");

    obj.rectangle70 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout61);
    obj.rectangle70:setAlign("client");
    obj.rectangle70:setColor("transparent");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setXradius(10);
    obj.rectangle70:setYradius(10);
    obj.rectangle70:setCornerType("bevel");
    obj.rectangle70:setStrokeDash("dash");
    obj.rectangle70:setMargins({left=3, right=5});
    obj.rectangle70:setName("rectangle70");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.rectangle70);
    obj.label103:setField("spiritCharmDice");
    lfm_setPropAsString(obj.label103, "fontStyle",  "bold");
    obj.label103:setAlign("client");
    obj.label103:setMargins({left=105, right=10});
    obj.label103:setHorzTextAlign("trailing");
    obj.label103:setName("label103");
    obj.label103:setFontColor("Moccasin");

    obj.comboBox14 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.rectangle70);
    obj.comboBox14:setField("spiritCharmLevel");
    obj.comboBox14:setText("Destreinado");
    obj.comboBox14:setAlign("client");
    obj.comboBox14:setTransparent(true);
    obj.comboBox14:setMargins({left=5,right=55});
    obj.comboBox14:setHorzTextAlign("center");
    obj.comboBox14:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox14:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox14:setFontColor("White");
    obj.comboBox14:setName("comboBox14");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle69);
    obj.layout62:setAlign("client");
    obj.layout62:setMargins({top=95, bottom=150});
    obj.layout62:setName("layout62");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout62);
    obj.label104:setText("Comando:");
    obj.label104:setWordWrap(true);
    lfm_setPropAsString(obj.label104, "fontStyle",  "bold");
    obj.label104:setAlign("left");
    obj.label104:setWidth(70);
    obj.label104:setMargins({left=10});
    obj.label104:setName("label104");
    obj.label104:setFontColor("Moccasin");

    obj.rectangle71 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout62);
    obj.rectangle71:setAlign("client");
    obj.rectangle71:setColor("transparent");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setXradius(10);
    obj.rectangle71:setYradius(10);
    obj.rectangle71:setCornerType("bevel");
    obj.rectangle71:setStrokeDash("dash");
    obj.rectangle71:setMargins({left=3, right=5});
    obj.rectangle71:setName("rectangle71");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.rectangle71);
    obj.label105:setField("spiritCommandDice");
    lfm_setPropAsString(obj.label105, "fontStyle",  "bold");
    obj.label105:setAlign("client");
    obj.label105:setMargins({left=105, right=10});
    obj.label105:setHorzTextAlign("trailing");
    obj.label105:setName("label105");
    obj.label105:setFontColor("Moccasin");

    obj.comboBox15 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.rectangle71);
    obj.comboBox15:setField("spiritCommandLevel");
    obj.comboBox15:setText("Destreinado");
    obj.comboBox15:setAlign("client");
    obj.comboBox15:setTransparent(true);
    obj.comboBox15:setMargins({left=5,right=55});
    obj.comboBox15:setHorzTextAlign("center");
    obj.comboBox15:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox15:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox15:setFontColor("White");
    obj.comboBox15:setName("comboBox15");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle69);
    obj.layout63:setAlign("client");
    obj.layout63:setMargins({top=155, bottom=90});
    obj.layout63:setName("layout63");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout63);
    obj.label106:setText("Foco:");
    obj.label106:setWordWrap(true);
    lfm_setPropAsString(obj.label106, "fontStyle",  "bold");
    obj.label106:setAlign("left");
    obj.label106:setWidth(70);
    obj.label106:setMargins({left=10});
    obj.label106:setName("label106");
    obj.label106:setFontColor("Moccasin");

    obj.rectangle72 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout63);
    obj.rectangle72:setAlign("client");
    obj.rectangle72:setColor("transparent");
    obj.rectangle72:setStrokeColor("white");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setXradius(10);
    obj.rectangle72:setYradius(10);
    obj.rectangle72:setCornerType("bevel");
    obj.rectangle72:setStrokeDash("dash");
    obj.rectangle72:setMargins({left=3, right=5});
    obj.rectangle72:setName("rectangle72");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.rectangle72);
    obj.label107:setField("spiritFocusDice");
    lfm_setPropAsString(obj.label107, "fontStyle",  "bold");
    obj.label107:setAlign("client");
    obj.label107:setMargins({left=105, right=10});
    obj.label107:setHorzTextAlign("trailing");
    obj.label107:setName("label107");
    obj.label107:setFontColor("Moccasin");

    obj.comboBox16 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.rectangle72);
    obj.comboBox16:setField("spiritFocusLevel");
    obj.comboBox16:setText("Destreinado");
    obj.comboBox16:setAlign("client");
    obj.comboBox16:setTransparent(true);
    obj.comboBox16:setMargins({left=5,right=55});
    obj.comboBox16:setHorzTextAlign("center");
    obj.comboBox16:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox16:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox16:setFontColor("White");
    obj.comboBox16:setName("comboBox16");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle69);
    obj.layout64:setAlign("client");
    obj.layout64:setMargins({top=215, bottom=30});
    obj.layout64:setName("layout64");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout64);
    obj.label108:setText("Intuição:");
    obj.label108:setWordWrap(true);
    lfm_setPropAsString(obj.label108, "fontStyle",  "bold");
    obj.label108:setAlign("left");
    obj.label108:setWidth(70);
    obj.label108:setMargins({left=10});
    obj.label108:setName("label108");
    obj.label108:setFontColor("Moccasin");

    obj.rectangle73 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout64);
    obj.rectangle73:setAlign("client");
    obj.rectangle73:setColor("transparent");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setXradius(10);
    obj.rectangle73:setYradius(10);
    obj.rectangle73:setCornerType("bevel");
    obj.rectangle73:setStrokeDash("dash");
    obj.rectangle73:setMargins({left=3, right=5});
    obj.rectangle73:setName("rectangle73");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.rectangle73);
    obj.label109:setField("spiritIntuitionDice");
    lfm_setPropAsString(obj.label109, "fontStyle",  "bold");
    obj.label109:setAlign("client");
    obj.label109:setMargins({left=105, right=10});
    obj.label109:setHorzTextAlign("trailing");
    obj.label109:setName("label109");
    obj.label109:setFontColor("Moccasin");

    obj.comboBox17 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.rectangle73);
    obj.comboBox17:setField("spiritIntuitionLevel");
    obj.comboBox17:setText("Destreinado");
    obj.comboBox17:setAlign("client");
    obj.comboBox17:setTransparent(true);
    obj.comboBox17:setMargins({left=5,right=55});
    obj.comboBox17:setHorzTextAlign("center");
    obj.comboBox17:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox17:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox17:setFontColor("White");
    obj.comboBox17:setName("comboBox17");

    obj.secondStatRow = gui.fromHandle(_obj_newObject("layout"));
    obj.secondStatRow:setParent(obj.tab2);
    obj.secondStatRow:setName("secondStatRow");
    obj.secondStatRow:setAlign("bottom");
    obj.secondStatRow:setHeight(320);
    obj.secondStatRow:setMargins({top=340, bottom=8});

    obj.mindSection = gui.fromHandle(_obj_newObject("layout"));
    obj.mindSection:setParent(obj.secondStatRow);
    obj.mindSection:setName("mindSection");
    obj.mindSection:setAlign("right");
    obj.mindSection:setWidth(280);
    obj.mindSection:setMargins({right=15});

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.mindSection);
    obj.layout65:setAlign("client");
    obj.layout65:setMargins({top=10,bottom=10});
    obj.layout65:setName("layout65");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout65);
    obj.label110:setText("MENTE");
    lfm_setPropAsString(obj.label110, "fontStyle",  "bold");
    obj.label110:setAlign("top");
    obj.label110:setWidth(60);
    obj.label110:setMargins({left=1});
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");
    obj.label110:setFontColor("Moccasin");

    obj.rectangle74 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout65);
    obj.rectangle74:setAlign("client");
    obj.rectangle74:setColor("transparent");
    obj.rectangle74:setStrokeColor("white");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setXradius(10);
    obj.rectangle74:setYradius(10);
    obj.rectangle74:setCornerType("round");
    obj.rectangle74:setStrokeDash("dash");
    obj.rectangle74:setMargins({left=10, top=5, right=1});
    obj.rectangle74:setName("rectangle74");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle74);
    obj.layout66:setAlign("client");
    obj.layout66:setMargins({top=5, bottom=250});
    obj.layout66:setName("layout66");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout66);
    obj.label111:setText("Ed. Geral:");
    obj.label111:setWordWrap(true);
    lfm_setPropAsString(obj.label111, "fontStyle",  "bold");
    obj.label111:setAlign("left");
    obj.label111:setWidth(70);
    obj.label111:setMargins({left=10});
    obj.label111:setName("label111");
    obj.label111:setFontColor("Moccasin");

    obj.rectangle75 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout66);
    obj.rectangle75:setAlign("client");
    obj.rectangle75:setColor("transparent");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setXradius(10);
    obj.rectangle75:setYradius(10);
    obj.rectangle75:setCornerType("bevel");
    obj.rectangle75:setStrokeDash("dash");
    obj.rectangle75:setMargins({left=3, right=5});
    obj.rectangle75:setName("rectangle75");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.rectangle75);
    obj.label112:setField("mindGenEdDice");
    lfm_setPropAsString(obj.label112, "fontStyle",  "bold");
    obj.label112:setAlign("client");
    obj.label112:setMargins({left=105, right=10});
    obj.label112:setHorzTextAlign("trailing");
    obj.label112:setName("label112");
    obj.label112:setFontColor("Moccasin");

    obj.comboBox18 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.rectangle75);
    obj.comboBox18:setField("mindGenEdLevel");
    obj.comboBox18:setText("Destreinado");
    obj.comboBox18:setAlign("client");
    obj.comboBox18:setTransparent(true);
    obj.comboBox18:setMargins({left=5,right=55});
    obj.comboBox18:setHorzTextAlign("center");
    obj.comboBox18:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox18:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox18:setFontColor("White");
    obj.comboBox18:setName("comboBox18");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle74);
    obj.layout67:setAlign("client");
    obj.layout67:setMargins({top=45, bottom=210});
    obj.layout67:setName("layout67");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout67);
    obj.label113:setText("Medicina:");
    obj.label113:setWordWrap(true);
    lfm_setPropAsString(obj.label113, "fontStyle",  "bold");
    obj.label113:setAlign("left");
    obj.label113:setWidth(70);
    obj.label113:setMargins({left=10});
    obj.label113:setName("label113");
    obj.label113:setFontColor("Moccasin");

    obj.rectangle76 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout67);
    obj.rectangle76:setAlign("client");
    obj.rectangle76:setColor("transparent");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setXradius(10);
    obj.rectangle76:setYradius(10);
    obj.rectangle76:setCornerType("bevel");
    obj.rectangle76:setStrokeDash("dash");
    obj.rectangle76:setMargins({left=3, right=5});
    obj.rectangle76:setName("rectangle76");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.rectangle76);
    obj.label114:setField("mindMedEdDice");
    lfm_setPropAsString(obj.label114, "fontStyle",  "bold");
    obj.label114:setAlign("client");
    obj.label114:setMargins({left=105, right=10});
    obj.label114:setHorzTextAlign("trailing");
    obj.label114:setName("label114");
    obj.label114:setFontColor("Moccasin");

    obj.comboBox19 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.rectangle76);
    obj.comboBox19:setField("mindMedEdLevel");
    obj.comboBox19:setText("Destreinado");
    obj.comboBox19:setAlign("client");
    obj.comboBox19:setTransparent(true);
    obj.comboBox19:setMargins({left=5,right=55});
    obj.comboBox19:setHorzTextAlign("center");
    obj.comboBox19:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox19:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox19:setFontColor("White");
    obj.comboBox19:setName("comboBox19");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle74);
    obj.layout68:setAlign("client");
    obj.layout68:setMargins({top=85, bottom=170});
    obj.layout68:setName("layout68");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout68);
    obj.label115:setText("Ed. Oculta:");
    obj.label115:setWordWrap(true);
    lfm_setPropAsString(obj.label115, "fontStyle",  "bold");
    obj.label115:setAlign("left");
    obj.label115:setWidth(70);
    obj.label115:setMargins({left=10});
    obj.label115:setName("label115");
    obj.label115:setFontColor("Moccasin");

    obj.rectangle77 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout68);
    obj.rectangle77:setAlign("client");
    obj.rectangle77:setColor("transparent");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setXradius(10);
    obj.rectangle77:setYradius(10);
    obj.rectangle77:setCornerType("bevel");
    obj.rectangle77:setStrokeDash("dash");
    obj.rectangle77:setMargins({left=3, right=5});
    obj.rectangle77:setName("rectangle77");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.rectangle77);
    obj.label116:setField("mindOccEdDice");
    lfm_setPropAsString(obj.label116, "fontStyle",  "bold");
    obj.label116:setAlign("client");
    obj.label116:setMargins({left=105, right=10});
    obj.label116:setHorzTextAlign("trailing");
    obj.label116:setName("label116");
    obj.label116:setFontColor("Moccasin");

    obj.comboBox20 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.rectangle77);
    obj.comboBox20:setField("mindOccEdLevel");
    obj.comboBox20:setText("Destreinado");
    obj.comboBox20:setAlign("client");
    obj.comboBox20:setTransparent(true);
    obj.comboBox20:setMargins({left=5,right=55});
    obj.comboBox20:setHorzTextAlign("center");
    obj.comboBox20:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox20:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox20:setFontColor("White");
    obj.comboBox20:setName("comboBox20");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle74);
    obj.layout69:setAlign("client");
    obj.layout69:setMargins({top=125, bottom=130});
    obj.layout69:setName("layout69");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout69);
    obj.label117:setText("Ed. Poke:");
    obj.label117:setWordWrap(true);
    lfm_setPropAsString(obj.label117, "fontStyle",  "bold");
    obj.label117:setAlign("left");
    obj.label117:setWidth(70);
    obj.label117:setMargins({left=10});
    obj.label117:setName("label117");
    obj.label117:setFontColor("Moccasin");

    obj.rectangle78 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout69);
    obj.rectangle78:setAlign("client");
    obj.rectangle78:setColor("transparent");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setXradius(10);
    obj.rectangle78:setYradius(10);
    obj.rectangle78:setCornerType("bevel");
    obj.rectangle78:setStrokeDash("dash");
    obj.rectangle78:setMargins({left=3, right=5});
    obj.rectangle78:setName("rectangle78");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.rectangle78);
    obj.label118:setField("mindPokeEdDice");
    lfm_setPropAsString(obj.label118, "fontStyle",  "bold");
    obj.label118:setAlign("client");
    obj.label118:setMargins({left=105, right=10});
    obj.label118:setHorzTextAlign("trailing");
    obj.label118:setName("label118");
    obj.label118:setFontColor("Moccasin");

    obj.comboBox21 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.rectangle78);
    obj.comboBox21:setField("mindPokeEdLevel");
    obj.comboBox21:setText("Destreinado");
    obj.comboBox21:setAlign("client");
    obj.comboBox21:setTransparent(true);
    obj.comboBox21:setMargins({left=5,right=55});
    obj.comboBox21:setHorzTextAlign("center");
    obj.comboBox21:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox21:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox21:setFontColor("White");
    obj.comboBox21:setName("comboBox21");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle74);
    obj.layout70:setAlign("client");
    obj.layout70:setMargins({top=165, bottom=90});
    obj.layout70:setName("layout70");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout70);
    obj.label119:setText("Ed. Tech:");
    obj.label119:setWordWrap(true);
    lfm_setPropAsString(obj.label119, "fontStyle",  "bold");
    obj.label119:setAlign("left");
    obj.label119:setWidth(70);
    obj.label119:setMargins({left=10});
    obj.label119:setName("label119");
    obj.label119:setFontColor("Moccasin");

    obj.rectangle79 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout70);
    obj.rectangle79:setAlign("client");
    obj.rectangle79:setColor("transparent");
    obj.rectangle79:setStrokeColor("white");
    obj.rectangle79:setStrokeSize(1);
    obj.rectangle79:setXradius(10);
    obj.rectangle79:setYradius(10);
    obj.rectangle79:setCornerType("bevel");
    obj.rectangle79:setStrokeDash("dash");
    obj.rectangle79:setMargins({left=3, right=5});
    obj.rectangle79:setName("rectangle79");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.rectangle79);
    obj.label120:setField("mindTechEdDice");
    lfm_setPropAsString(obj.label120, "fontStyle",  "bold");
    obj.label120:setAlign("client");
    obj.label120:setMargins({left=105, right=10});
    obj.label120:setHorzTextAlign("trailing");
    obj.label120:setName("label120");
    obj.label120:setFontColor("Moccasin");

    obj.comboBox22 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.rectangle79);
    obj.comboBox22:setField("mindTechEdLevel");
    obj.comboBox22:setText("Destreinado");
    obj.comboBox22:setAlign("client");
    obj.comboBox22:setTransparent(true);
    obj.comboBox22:setMargins({left=5,right=55});
    obj.comboBox22:setHorzTextAlign("center");
    obj.comboBox22:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox22:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox22:setFontColor("White");
    obj.comboBox22:setName("comboBox22");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle74);
    obj.layout71:setAlign("client");
    obj.layout71:setMargins({top=205, bottom=50});
    obj.layout71:setName("layout71");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout71);
    obj.label121:setText("Astúcia:");
    obj.label121:setWordWrap(true);
    lfm_setPropAsString(obj.label121, "fontStyle",  "bold");
    obj.label121:setAlign("left");
    obj.label121:setWidth(70);
    obj.label121:setMargins({left=10});
    obj.label121:setName("label121");
    obj.label121:setFontColor("Moccasin");

    obj.rectangle80 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout71);
    obj.rectangle80:setAlign("client");
    obj.rectangle80:setColor("transparent");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setXradius(10);
    obj.rectangle80:setYradius(10);
    obj.rectangle80:setCornerType("bevel");
    obj.rectangle80:setStrokeDash("dash");
    obj.rectangle80:setMargins({left=3, right=5});
    obj.rectangle80:setName("rectangle80");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.rectangle80);
    obj.label122:setField("mindGuileDice");
    lfm_setPropAsString(obj.label122, "fontStyle",  "bold");
    obj.label122:setAlign("client");
    obj.label122:setMargins({left=105, right=10});
    obj.label122:setHorzTextAlign("trailing");
    obj.label122:setName("label122");
    obj.label122:setFontColor("Moccasin");

    obj.comboBox23 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.rectangle80);
    obj.comboBox23:setField("mindGuileLevel");
    obj.comboBox23:setText("Destreinado");
    obj.comboBox23:setAlign("client");
    obj.comboBox23:setTransparent(true);
    obj.comboBox23:setMargins({left=5,right=55});
    obj.comboBox23:setHorzTextAlign("center");
    obj.comboBox23:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox23:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox23:setFontColor("White");
    obj.comboBox23:setName("comboBox23");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle74);
    obj.layout72:setAlign("client");
    obj.layout72:setMargins({top=245, bottom=10});
    obj.layout72:setName("layout72");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout72);
    obj.label123:setText("Percep.:");
    obj.label123:setWordWrap(true);
    lfm_setPropAsString(obj.label123, "fontStyle",  "bold");
    obj.label123:setAlign("left");
    obj.label123:setWidth(70);
    obj.label123:setMargins({left=10});
    obj.label123:setName("label123");
    obj.label123:setFontColor("Moccasin");

    obj.rectangle81 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout72);
    obj.rectangle81:setAlign("client");
    obj.rectangle81:setColor("transparent");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setXradius(10);
    obj.rectangle81:setYradius(10);
    obj.rectangle81:setCornerType("bevel");
    obj.rectangle81:setStrokeDash("dash");
    obj.rectangle81:setMargins({left=3, right=5});
    obj.rectangle81:setName("rectangle81");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.rectangle81);
    obj.label124:setField("mindPercepDice");
    lfm_setPropAsString(obj.label124, "fontStyle",  "bold");
    obj.label124:setAlign("client");
    obj.label124:setMargins({left=105, right=10});
    obj.label124:setHorzTextAlign("trailing");
    obj.label124:setName("label124");
    obj.label124:setFontColor("Moccasin");

    obj.comboBox24 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.rectangle81);
    obj.comboBox24:setField("mindPercepLevel");
    obj.comboBox24:setText("Destreinado");
    obj.comboBox24:setAlign("client");
    obj.comboBox24:setTransparent(true);
    obj.comboBox24:setMargins({left=5,right=55});
    obj.comboBox24:setHorzTextAlign("center");
    obj.comboBox24:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre'});
    obj.comboBox24:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox24:setFontColor("White");
    obj.comboBox24:setName("comboBox24");

    obj.capacitySection = gui.fromHandle(_obj_newObject("layout"));
    obj.capacitySection:setParent(obj.secondStatRow);
    obj.capacitySection:setName("capacitySection");
    obj.capacitySection:setAlign("right");
    obj.capacitySection:setWidth(280);
    obj.capacitySection:setMargins({right=15});

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.capacitySection);
    obj.layout73:setAlign("client");
    obj.layout73:setMargins({top=10,bottom=10});
    obj.layout73:setName("layout73");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout73);
    obj.label125:setText("CAPACIDADES");
    lfm_setPropAsString(obj.label125, "fontStyle",  "bold");
    obj.label125:setAlign("top");
    obj.label125:setWidth(60);
    obj.label125:setMargins({left=1});
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");
    obj.label125:setFontColor("Moccasin");

    obj.rectangle82 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout73);
    obj.rectangle82:setAlign("client");
    obj.rectangle82:setColor("transparent");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setXradius(10);
    obj.rectangle82:setYradius(10);
    obj.rectangle82:setCornerType("round");
    obj.rectangle82:setStrokeDash("dash");
    obj.rectangle82:setMargins({left=10, top=5, right=1});
    obj.rectangle82:setName("rectangle82");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle82);
    obj.layout74:setAlign("client");
    obj.layout74:setMargins({top=25, bottom=220});
    obj.layout74:setName("layout74");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout74);
    obj.label126:setText("Terra:");
    obj.label126:setWordWrap(true);
    lfm_setPropAsString(obj.label126, "fontStyle",  "bold");
    obj.label126:setAlign("left");
    obj.label126:setWidth(70);
    obj.label126:setMargins({left=10});
    obj.label126:setName("label126");
    obj.label126:setFontColor("Moccasin");

    obj.rectangle83 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout74);
    obj.rectangle83:setAlign("client");
    obj.rectangle83:setColor("transparent");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setXradius(10);
    obj.rectangle83:setYradius(10);
    obj.rectangle83:setCornerType("bevel");
    obj.rectangle83:setStrokeDash("dash");
    obj.rectangle83:setMargins({left=3, right=5});
    obj.rectangle83:setName("rectangle83");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.rectangle83);
    obj.label127:setField("trainerOverland");
    obj.label127:setAlign("client");
    obj.label127:setMargins({left=10, right=10});
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");
    obj.label127:setFontColor("Orange");
    lfm_setPropAsString(obj.label127, "fontStyle",  "bold");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle82);
    obj.layout75:setAlign("client");
    obj.layout75:setMargins({top=75, bottom=170});
    obj.layout75:setName("layout75");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout75);
    obj.label128:setText("Nado:");
    obj.label128:setWordWrap(true);
    lfm_setPropAsString(obj.label128, "fontStyle",  "bold");
    obj.label128:setAlign("left");
    obj.label128:setWidth(70);
    obj.label128:setMargins({left=10});
    obj.label128:setName("label128");
    obj.label128:setFontColor("Moccasin");

    obj.rectangle84 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout75);
    obj.rectangle84:setAlign("client");
    obj.rectangle84:setColor("transparent");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setXradius(10);
    obj.rectangle84:setYradius(10);
    obj.rectangle84:setCornerType("bevel");
    obj.rectangle84:setStrokeDash("dash");
    obj.rectangle84:setMargins({left=3, right=5});
    obj.rectangle84:setName("rectangle84");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.rectangle84);
    obj.label129:setField("trainerSwim");
    obj.label129:setAlign("client");
    obj.label129:setMargins({left=10, right=10});
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");
    obj.label129:setFontColor("Orange");
    lfm_setPropAsString(obj.label129, "fontStyle",  "bold");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle82);
    obj.layout76:setAlign("client");
    obj.layout76:setMargins({top=125, bottom=120});
    obj.layout76:setName("layout76");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout76);
    obj.label130:setText("Poder:");
    obj.label130:setWordWrap(true);
    lfm_setPropAsString(obj.label130, "fontStyle",  "bold");
    obj.label130:setAlign("left");
    obj.label130:setWidth(70);
    obj.label130:setMargins({left=10});
    obj.label130:setName("label130");
    obj.label130:setFontColor("Moccasin");

    obj.rectangle85 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout76);
    obj.rectangle85:setAlign("client");
    obj.rectangle85:setColor("transparent");
    obj.rectangle85:setStrokeColor("white");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setXradius(10);
    obj.rectangle85:setYradius(10);
    obj.rectangle85:setCornerType("bevel");
    obj.rectangle85:setStrokeDash("dash");
    obj.rectangle85:setMargins({left=3, right=5});
    obj.rectangle85:setName("rectangle85");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.rectangle85);
    obj.label131:setField("trainerPower");
    obj.label131:setAlign("client");
    obj.label131:setMargins({left=10, right=10});
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");
    obj.label131:setFontColor("Orange");
    lfm_setPropAsString(obj.label131, "fontStyle",  "bold");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle82);
    obj.layout77:setAlign("client");
    obj.layout77:setMargins({top=175, bottom=70});
    obj.layout77:setName("layout77");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout77);
    obj.label132:setText("Arremesso:");
    obj.label132:setWordWrap(true);
    lfm_setPropAsString(obj.label132, "fontStyle",  "bold");
    obj.label132:setAlign("left");
    obj.label132:setWidth(70);
    obj.label132:setMargins({left=10});
    obj.label132:setName("label132");
    obj.label132:setFontColor("Moccasin");

    obj.rectangle86 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout77);
    obj.rectangle86:setAlign("client");
    obj.rectangle86:setColor("transparent");
    obj.rectangle86:setStrokeColor("white");
    obj.rectangle86:setStrokeSize(1);
    obj.rectangle86:setXradius(10);
    obj.rectangle86:setYradius(10);
    obj.rectangle86:setCornerType("bevel");
    obj.rectangle86:setStrokeDash("dash");
    obj.rectangle86:setMargins({left=3, right=5});
    obj.rectangle86:setName("rectangle86");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.rectangle86);
    obj.label133:setField("trainerThrow");
    obj.label133:setAlign("client");
    obj.label133:setMargins({left=10, right=10});
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");
    obj.label133:setFontColor("Orange");
    lfm_setPropAsString(obj.label133, "fontStyle",  "bold");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle82);
    obj.layout78:setAlign("client");
    obj.layout78:setMargins({top=225, bottom=20});
    obj.layout78:setName("layout78");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout78);
    obj.label134:setText("Salto V/H:");
    obj.label134:setWordWrap(true);
    lfm_setPropAsString(obj.label134, "fontStyle",  "bold");
    obj.label134:setAlign("left");
    obj.label134:setWidth(70);
    obj.label134:setMargins({left=10});
    obj.label134:setName("label134");
    obj.label134:setFontColor("Moccasin");

    obj.rectangle87 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout78);
    obj.rectangle87:setAlign("client");
    obj.rectangle87:setColor("transparent");
    obj.rectangle87:setStrokeColor("white");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setXradius(10);
    obj.rectangle87:setYradius(10);
    obj.rectangle87:setCornerType("bevel");
    obj.rectangle87:setStrokeDash("dash");
    obj.rectangle87:setMargins({left=3, right=110});
    obj.rectangle87:setName("rectangle87");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.rectangle87);
    obj.label135:setField("trainerJumpV");
    obj.label135:setAlign("client");
    obj.label135:setMargins({left=10, right=10});
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");
    obj.label135:setFontColor("Orange");
    lfm_setPropAsString(obj.label135, "fontStyle",  "bold");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout78);
    obj.label136:setText("/");
    lfm_setPropAsString(obj.label136, "fontStyle",  "bold");
    obj.label136:setAlign("client");
    obj.label136:setMargins({left=80, right=80});
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");
    obj.label136:setFontColor("Moccasin");

    obj.rectangle88 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout78);
    obj.rectangle88:setAlign("client");
    obj.rectangle88:setColor("transparent");
    obj.rectangle88:setStrokeColor("white");
    obj.rectangle88:setStrokeSize(1);
    obj.rectangle88:setXradius(10);
    obj.rectangle88:setYradius(10);
    obj.rectangle88:setCornerType("bevel");
    obj.rectangle88:setStrokeDash("dash");
    obj.rectangle88:setMargins({left=110, right=5});
    obj.rectangle88:setName("rectangle88");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.rectangle88);
    obj.label137:setField("trainerJumpH");
    obj.label137:setAlign("client");
    obj.label137:setMargins({left=10, right=10});
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");
    obj.label137:setFontColor("Orange");
    lfm_setPropAsString(obj.label137, "fontStyle",  "bold");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Edges");
    obj.tab3:setName("tab3");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.tab3);
    obj.button8:setLeft(5);
    obj.button8:setTop(5);
    obj.button8:setHeight(25);
    obj.button8:setAlign("top");
    obj.button8:setText("Adicionar Edge");
    obj.button8:setName("button8");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab3);
    obj.scrollBox2:setMargins({top=5});
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rclEdges = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclEdges:setParent(obj.scrollBox2);
    obj.rclEdges:setName("rclEdges");
    obj.rclEdges:setField("recEdges");
    obj.rclEdges:setTemplateForm("frmEdges");
    obj.rclEdges:setAlign("client");
    obj.rclEdges:setAutoHeight(true);

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Features");
    obj.tab4:setName("tab4");

    obj.tabControl2 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.tab4);
    obj.tabControl2:setLeft(20);
    obj.tabControl2:setTop(20);
    obj.tabControl2:setAlign("client");
    obj.tabControl2:setName("tabControl2");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl2);
    obj.tab5:setTitle("Features");
    obj.tab5:setName("tab5");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.tab5);
    obj.button9:setLeft(5);
    obj.button9:setTop(5);
    obj.button9:setHeight(25);
    obj.button9:setAlign("top");
    obj.button9:setText("Adicionar Talento");
    obj.button9:setName("button9");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.tab5);
    obj.scrollBox3:setMargins({top=5});
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rclFeats = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclFeats:setParent(obj.scrollBox3);
    obj.rclFeats:setName("rclFeats");
    obj.rclFeats:setField("recFeats");
    obj.rclFeats:setTemplateForm("frmFeats");
    obj.rclFeats:setAlign("client");
    obj.rclFeats:setLayout("vertical");
    obj.rclFeats:setMinQt(1);
    obj.rclFeats:setAutoHeight(true);

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl2);
    obj.tab6:setTitle("Classes");
    obj.tab6:setName("tab6");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.tab6);
    obj.button10:setLeft(5);
    obj.button10:setTop(5);
    obj.button10:setHeight(25);
    obj.button10:setAlign("top");
    obj.button10:setText("Adicionar Classe");
    obj.button10:setName("button10");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.tab6);
    obj.scrollBox4:setMargins({top=5});
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rclClass = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclClass:setParent(obj.scrollBox4);
    obj.rclClass:setName("rclClass");
    obj.rclClass:setField("recClass");
    obj.rclClass:setTemplateForm("frmClass");
    obj.rclClass:setAlign("client");
    obj.rclClass:setAutoHeight(true);

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Mochila");
    obj.tab7:setName("tab7");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.tab7);
    obj.button11:setHeight(25);
    obj.button11:setAlign("top");
    obj.button11:setText("Adicionar Item");
    obj.button11:setName("button11");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.tab7);
    obj.layout79:setAlign("top");
    obj.layout79:setMargins({left=10, top=10, right=300, bottom=5});
    obj.layout79:setHeight(30);
    obj.layout79:setName("layout79");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout79);
    obj.label138:setText("Dinheiro:");
    lfm_setPropAsString(obj.label138, "fontStyle",  "bold");
    obj.label138:setAlign("left");
    obj.label138:setWidth(80);
    obj.label138:setName("label138");
    obj.label138:setFontColor("Moccasin");

    obj.rectangle89 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout79);
    obj.rectangle89:setAlign("client");
    obj.rectangle89:setMargins({left=5, right=2});
    obj.rectangle89:setName("rectangle89");
    obj.rectangle89:setColor("transparent");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setXradius(10);
    obj.rectangle89:setYradius(10);
    obj.rectangle89:setCornerType("bevel");
    obj.rectangle89:setStrokeDash("dash");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle89);
    obj.edit23:setField("trainerMoney");
    obj.edit23:setAlign("client");
    obj.edit23:setType("number");
    obj.edit23:setTransparent(true);
    obj.edit23:setMargins({left=5, right=5});
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");
    obj.edit23:setFontColor("White");
    lfm_setPropAsString(obj.edit23, "fontStyle",  "bold");

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.tab7);
    obj.scrollBox5:setMargins({top=5});
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox5);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setOrientation("vertical");
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setMargins({top=5, left=5, right=5});
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout2);
    obj.flowPart2:setMinWidth(550);
    obj.flowPart2:setMaxWidth(550);
    obj.flowPart2:setHeight(800);
    obj.flowPart2:setAdjustHeightToLine(true);
    obj.flowPart2:setName("flowPart2");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.flowPart2);
    obj.layout80:setAlign("client");
    obj.layout80:setName("layout80");

    obj.rclBag = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclBag:setParent(obj.layout80);
    obj.rclBag:setName("rclBag");
    obj.rclBag:setField("recBag");
    obj.rclBag:setTemplateForm("frmBag");
    obj.rclBag:setAlign("client");
    obj.rclBag:setAutoHeight(true);

    obj.tab8 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Moves");
    obj.tab8:setName("tab8");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.tab8);
    obj.button12:setLeft(5);
    obj.button12:setTop(5);
    obj.button12:setHeight(25);
    obj.button12:setAlign("top");
    obj.button12:setText("Adicionar Move");
    obj.button12:setName("button12");

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.tab8);
    obj.scrollBox6:setMargins({top=5});
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.rclMoves = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMoves:setParent(obj.scrollBox6);
    obj.rclMoves:setName("rclMoves");
    obj.rclMoves:setField("recMoves");
    obj.rclMoves:setTemplateForm("frmMoves");
    obj.rclMoves:setAlign("client");
    obj.rclMoves:setLayout("vertical");
    obj.rclMoves:setMinQt(1);
    obj.rclMoves:setAutoHeight(true);

    obj.tab9 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Pokédex");
    obj.tab9:setName("tab9");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.tab9);
    obj.button13:setAlign("top");
    obj.button13:setHeight(25);
    obj.button13:setText("Adicionar Entrada");
    obj.button13:setName("button13");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.tab9);
    obj.layout81:setAlign("top");
    obj.layout81:setWidth(170);
    obj.layout81:setHeight(30);
    obj.layout81:setMargins({top=5, bottom=5, left=15});
    obj.layout81:setName("layout81");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout81);
    obj.label139:setText("Capturados:");
    obj.label139:setAlign("left");
    obj.label139:setWidth(80);
    obj.label139:setName("label139");
    obj.label139:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label139, "fontStyle",  "bold");

    obj.rectangle90 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout81);
    obj.rectangle90:setAlign("left");
    obj.rectangle90:setMargins({left=5});
    obj.rectangle90:setName("rectangle90");
    obj.rectangle90:setColor("transparent");
    obj.rectangle90:setStrokeColor("Orange");
    obj.rectangle90:setStrokeSize(1);
    obj.rectangle90:setXradius(10);
    obj.rectangle90:setYradius(10);
    obj.rectangle90:setCornerType("innerRound");
    obj.rectangle90:setStrokeDash("dash");

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.rectangle90);
    obj.label140:setField("trainerPokeCaught");
    obj.label140:setAlign("client");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");
    obj.label140:setFontColor("Orange");
    lfm_setPropAsString(obj.label140, "fontStyle",  "bold");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout81);
    obj.label141:setText("Vistos:");
    obj.label141:setAlign("left");
    obj.label141:setWidth(80);
    obj.label141:setMargins({left=80});
    obj.label141:setName("label141");
    obj.label141:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label141, "fontStyle",  "bold");

    obj.rectangle91 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout81);
    obj.rectangle91:setAlign("left");
    obj.rectangle91:setMargins({left=10});
    obj.rectangle91:setName("rectangle91");
    obj.rectangle91:setColor("transparent");
    obj.rectangle91:setStrokeColor("Orange");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setXradius(10);
    obj.rectangle91:setYradius(10);
    obj.rectangle91:setCornerType("innerRound");
    obj.rectangle91:setStrokeDash("dash");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.rectangle91);
    obj.label142:setField("trainerPokeSeen");
    obj.label142:setAlign("client");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");
    obj.label142:setFontColor("Orange");
    lfm_setPropAsString(obj.label142, "fontStyle",  "bold");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.tab9);
    obj.layout82:setAlign("client");
    obj.layout82:setTop(35);
    obj.layout82:setName("layout82");

    obj.scrollBox7 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.layout82);
    obj.scrollBox7:setMargins({top=5});
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.rclDex = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclDex:setParent(obj.scrollBox7);
    obj.rclDex:setName("rclDex");
    obj.rclDex:setField("recDex");
    obj.rclDex:setTemplateForm("frmDex");
    obj.rclDex:setAlign("client");
    obj.rclDex:setLayout("horizontalTiles");
    obj.rclDex:setMinQt(1);
    obj.rclDex:setSelectable(true);


							function self.recalcDex()
							
								if sheet ~= nil then
									local pokeSeenTotal = 0;
									local pokeCaughtTotal = 0;
									local nodes = ndb.getChildNodes(sheet.recDex);
									
									for i=1, #nodes, 1 do
										pokeSeenTotal = pokeSeenTotal + 1;
										if nodes[i].pokeCaught then
											pokeCaughtTotal = pokeCaughtTotal +1;
										end					
									end	
									sheet.trainerPokeSeen = pokeSeenTotal;
									sheet.trainerPokeCaught = pokeCaughtTotal;								
								end;
							end
						


    obj.tab10 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Anotações");
    obj.tab10:setName("tab10");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.tab10);
    obj.layout83:setAlign("top");
    obj.layout83:setHeight(325);
    obj.layout83:setName("layout83");

    obj.rectangle92 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout83);
    obj.rectangle92:setAlign("left");
    obj.rectangle92:setWidth(280);
    obj.rectangle92:setMargins({top=5, left=15, bottom=5});
    obj.rectangle92:setName("rectangle92");
    obj.rectangle92:setColor("transparent");
    obj.rectangle92:setStrokeColor("white");
    obj.rectangle92:setStrokeSize(1);
    obj.rectangle92:setXradius(10);
    obj.rectangle92:setYradius(10);
    obj.rectangle92:setCornerType("bevel");
    obj.rectangle92:setStrokeDash("dash");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle92);
    obj.textEditor5:setField("pokeAnnotations");
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setWidth(180);
    obj.textEditor5:setMargins({top=5, bottom=5, left=5, right=5});
    obj.textEditor5:setName("textEditor5");

    obj.rectangle93 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout83);
    obj.rectangle93:setAlign("left");
    obj.rectangle93:setWidth(280);
    obj.rectangle93:setMargins({top=5, left=10, bottom=5});
    obj.rectangle93:setName("rectangle93");
    obj.rectangle93:setColor("transparent");
    obj.rectangle93:setStrokeColor("white");
    obj.rectangle93:setStrokeSize(1);
    obj.rectangle93:setXradius(10);
    obj.rectangle93:setYradius(10);
    obj.rectangle93:setCornerType("bevel");
    obj.rectangle93:setStrokeDash("dash");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle93);
    obj.textEditor6:setField("pokeAnnotations2");
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setWidth(180);
    obj.textEditor6:setMargins({top=5, bottom=5, left=5, right=5});
    obj.textEditor6:setName("textEditor6");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.tab10);
    obj.layout84:setAlign("top");
    obj.layout84:setHeight(325);
    obj.layout84:setName("layout84");

    obj.rectangle94 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout84);
    obj.rectangle94:setAlign("left");
    obj.rectangle94:setWidth(280);
    obj.rectangle94:setMargins({top=5, left=15, bottom=5});
    obj.rectangle94:setName("rectangle94");
    obj.rectangle94:setColor("transparent");
    obj.rectangle94:setStrokeColor("white");
    obj.rectangle94:setStrokeSize(1);
    obj.rectangle94:setXradius(10);
    obj.rectangle94:setYradius(10);
    obj.rectangle94:setCornerType("bevel");
    obj.rectangle94:setStrokeDash("dash");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle94);
    obj.textEditor7:setField("pokeAnnotations3");
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setWidth(180);
    obj.textEditor7:setMargins({top=5, bottom=5, left=5, right=5});
    obj.textEditor7:setName("textEditor7");

    obj.rectangle95 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout84);
    obj.rectangle95:setAlign("left");
    obj.rectangle95:setWidth(280);
    obj.rectangle95:setMargins({top=5, left=10, bottom=5});
    obj.rectangle95:setName("rectangle95");
    obj.rectangle95:setColor("transparent");
    obj.rectangle95:setStrokeColor("white");
    obj.rectangle95:setStrokeSize(1);
    obj.rectangle95:setXradius(10);
    obj.rectangle95:setYradius(10);
    obj.rectangle95:setCornerType("bevel");
    obj.rectangle95:setStrokeDash("dash");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle95);
    obj.textEditor8:setField("pokeAnnotations4");
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setWidth(180);
    obj.textEditor8:setMargins({top=5, bottom=5, left=5, right=5});
    obj.textEditor8:setName("textEditor8");

    obj.tab11 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl1);
    obj.tab11:setTitle("Calculations");
    obj.tab11:setVisible(false);
    obj.tab11:setName("tab11");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.tab11);
    obj.label143:setField("fullPV");
    obj.label143:setAlign("client");
    obj.label143:setName("label143");
    obj.label143:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label143, "fontStyle",  "bold");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.tab11);
    obj.label144:setField("trainerCmbtStgHPVlr");
    obj.label144:setAlign("client");
    obj.label144:setName("label144");
    obj.label144:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label144, "fontStyle",  "bold");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.tab11);
    obj.label145:setField("trainerCmbtStgSpeedVlr");
    obj.label145:setAlign("client");
    obj.label145:setName("label145");
    obj.label145:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label145, "fontStyle",  "bold");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.tab11);
    obj.label146:setField("trainerCmbtStgAtkVlr");
    obj.label146:setAlign("client");
    obj.label146:setName("label146");
    obj.label146:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label146, "fontStyle",  "bold");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.tab11);
    obj.label147:setField("trainerCmbtStgDefVlr");
    obj.label147:setAlign("client");
    obj.label147:setName("label147");
    obj.label147:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label147, "fontStyle",  "bold");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.tab11);
    obj.label148:setField("trainerCmbtStgSpAtkVlr");
    obj.label148:setAlign("client");
    obj.label148:setName("label148");
    obj.label148:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label148, "fontStyle",  "bold");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.tab11);
    obj.label149:setField("trainerCmbtStgSpDefVlr");
    obj.label149:setAlign("client");
    obj.label149:setName("label149");
    obj.label149:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label149, "fontStyle",  "bold");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.tab11);
    obj.textEditor9:setField("trainerPowers");
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setWidth(200);
    obj.textEditor9:setLeft(25);
    obj.textEditor9:setTop(10);
    obj.textEditor9:setName("textEditor9");

    obj.tab12 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.tabControl1);
    obj.tab12:setTitle("Plugin");
    obj.tab12:setName("tab12");

    obj.rectangle96 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.tab12);
    obj.rectangle96:setAlign("client");
    obj.rectangle96:setWidth(100);
    obj.rectangle96:setMargins({top=5, bottom=5, left=5, right=5});
    obj.rectangle96:setName("rectangle96");
    obj.rectangle96:setColor("transparent");
    obj.rectangle96:setStrokeColor("white");
    obj.rectangle96:setStrokeSize(1);
    obj.rectangle96:setXradius(10);
    obj.rectangle96:setYradius(10);
    obj.rectangle96:setCornerType("bevel");
    obj.rectangle96:setStrokeDash("dash");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle96);
    obj.layout85:setAlign("top");
    obj.layout85:setHeight(40);
    obj.layout85:setMargins({top=10, left=25});
    obj.layout85:setName("layout85");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout85);
    obj.label150:setText("Versão:");
    obj.label150:setAlign("left");
    obj.label150:setWidth(80);
    obj.label150:setHorzTextAlign("leading");
    obj.label150:setName("label150");
    obj.label150:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label150, "fontStyle",  "bold");
    obj.label150:setFontSize(18);

    obj.rectangle97 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout85);
    obj.rectangle97:setAlign("left");
    obj.rectangle97:setWidth(100);
    obj.rectangle97:setStrokeColor("orange");
    obj.rectangle97:setMargins({left=10});
    obj.rectangle97:setName("rectangle97");
    obj.rectangle97:setColor("transparent");
    obj.rectangle97:setStrokeSize(1);
    obj.rectangle97:setXradius(10);
    obj.rectangle97:setYradius(10);
    obj.rectangle97:setCornerType("bevel");
    obj.rectangle97:setStrokeDash("dash");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.rectangle97);
    obj.label151:setText("2.0");
    obj.label151:setAlign("client");
    obj.label151:setMargins({top=5, bottom=5, left=5, right=5});
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");
    obj.label151:setFontColor("Orange");
    lfm_setPropAsString(obj.label151, "fontStyle",  "bold");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout85);
    obj.button14:setText("Baixar Plugin");
    obj.button14:setAlign("right");
    obj.button14:setWidth(300);
    obj.button14:setMargins({top=5, right=20});
    obj.button14:setName("button14");

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.rectangle96);
    obj.label152:setText("Originalmente desenvolvido para a mesa District League");
    obj.label152:setAlign("top");
    obj.label152:setWidth(600);
    obj.label152:setHeight(40);
    obj.label152:setMargins({top=30});
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");
    obj.label152:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label152, "fontStyle",  "bold");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle96);
    obj.layout86:setAlign("top");
    obj.layout86:setHeight(410);
    obj.layout86:setMargins({top=10});
    obj.layout86:setName("layout86");

    obj.layout87 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout86);
    obj.layout87:setAlign("left");
    obj.layout87:setWidth(90);
    obj.layout87:setName("layout87");

    obj.rectangle98 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout86);
    obj.rectangle98:setAlign("left");
    obj.rectangle98:setWidth(410);
    obj.rectangle98:setColor("white");
    obj.rectangle98:setStrokeColor("black");
    obj.rectangle98:setStrokeSize(1);
    obj.rectangle98:setCornerType("innerLine");
    obj.rectangle98:setStrokeDash("dash");
    obj.rectangle98:setName("rectangle98");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle98);
    obj.image2:setSRC("img/district_league_logo.png");
    obj.image2:setStyle("proportional");
    obj.image2:setCenter(true);
    obj.image2:setLeft(5);
    obj.image2:setTop(5);
    obj.image2:setWidth(400);
    obj.image2:setHeight(400);
    obj.image2:setName("image2");

    obj.layout88 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout86);
    obj.layout88:setAlign("left");
    obj.layout88:setWidth(95);
    obj.layout88:setName("layout88");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle96);
    obj.button15:setText("Conheça a Mesa");
    obj.button15:setAlign("top");
    obj.button15:setWidth(50);
    obj.button15:setMargins({top=10, left=90, right=85});
    obj.button15:setName("button15");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.rectangle96);
    obj.label153:setText("Design e Programação por Shakerskj");
    obj.label153:setAlign("bottom");
    obj.label153:setWidth(600);
    obj.label153:setHeight(40);
    obj.label153:setMargins({top=10, left=25});
    obj.label153:setHorzTextAlign("leading");
    obj.label153:setName("label153");
    obj.label153:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label153, "fontStyle",  "bold");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("bodyAcroLevel");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("bodyAthleticsLevel");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("bodyCombatLevel");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("bodyStealthLevel");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("bodyIntimidateLevel");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("bodySurvivalLevel");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setField("spiritCharmLevel");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setField("spiritCommandLevel");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setField("spiritFocusLevel");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setField("spiritIntuitionLevel");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setField("mindGenEdLevel");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj);
    obj.dataLink12:setField("mindMedEdLevel");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj);
    obj.dataLink13:setField("mindOccEdLevel");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj);
    obj.dataLink14:setField("mindPokeEdLevel");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj);
    obj.dataLink15:setField("mindtechEdLevel");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj);
    obj.dataLink16:setField("mindGuileLevel");
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj);
    obj.dataLink17:setField("mindPercepLevel");
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj);
    obj.dataLink18:setFields({'bodyAcroLevel', 'bodyAthleticsLevel'});
    obj.dataLink18:setName("dataLink18");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj);
    obj.dataLink19:setFields({'trainerLevel', 'trainerDef', 'trainerSpDef', 'trainerSpeed', 'trainerHP'});
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj);
    obj.dataLink20:setField("bodyAthleticsLevel");
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj);
    obj.dataLink21:setField("bodyCombatLevel");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj);
    obj.dataLink22:setField("bodyAcroLevel");
    obj.dataLink22:setName("dataLink22");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj);
    obj.dataLink23:setFields({'trainerInjuriesQtd', 'trainerHP', 'trainerLevel'});
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj);
    obj.dataLink24:setFields({'trainerCmbtStgAtk', 'trainerAtk'});
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj);
    obj.dataLink25:setFields({'trainerCmbtStgDef', 'trainerDef'});
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj);
    obj.dataLink26:setFields({'trainerCmbtStgSpeed', 'trainerSpeed'});
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj);
    obj.dataLink27:setFields({'trainerCmbtStgSpAtk', 'trainerSpAtk'});
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj);
    obj.dataLink28:setFields({'trainerCmbtStgSpDef', 'trainerSpDef'});
    obj.dataLink28:setName("dataLink28");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("trainerIDPopUp");
            									
            										if pop ~= nil then
            											pop:setNodeObject(self.sheet);
            											pop:showPopupEx("center", self.AtrBut);
            										else
            											showMessage("Ops, bug.. nao encontrei o popup do treinador para exibir");
            										end;
        end, obj);

    obj._e_event1 = obj.progressBar1:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("xpPopUp");
            							
            								if pop ~= nil then
            									pop:setNodeObject(self.sheet);
            									pop:showPopupEx("center", self.AtrBut);
            								else
            									showMessage("Ops, bug.. nao encontrei o popup de XP para exibir");
            								end;
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("hpPopUp");
            								
            									if pop ~= nil then
            										pop:setNodeObject(self.sheet);
            										pop:showPopupEx("center", self.AtrBut);
            									else
            										showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            									end;
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("atkPopUp");
            								
            									if pop ~= nil then
            										pop:setNodeObject(self.sheet);
            										pop:showPopupEx("center", self.AtrBut);
            									else
            										showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            									end;
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("defPopUp");
            								
            									if pop ~= nil then
            										pop:setNodeObject(self.sheet);
            										pop:showPopupEx("center", self.AtrBut);
            									else
            										showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            									end;
        end, obj);

    obj._e_event5 = obj.button5:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("spdPopUp");
            								
            									if pop ~= nil then
            										pop:setNodeObject(self.sheet);
            										pop:showPopupEx("center", self.AtrBut);
            									else
            										showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            									end;
        end, obj);

    obj._e_event6 = obj.button6:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("spAtkPopUp");
            								
            									if pop ~= nil then
            										pop:setNodeObject(self.sheet);
            										pop:showPopupEx("center", self.AtrBut);
            									else
            										showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            									end;
        end, obj);

    obj._e_event7 = obj.button7:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("spDefPopUp");
            								
            									if pop ~= nil then
            										pop:setNodeObject(self.sheet);
            										pop:showPopupEx("center", self.AtrBut);
            									else
            										showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            									end;
        end, obj);

    obj._e_event8 = obj.button8:addEventListener("onClick",
        function (self)
            self.rclEdges:append();
        end, obj);

    obj._e_event9 = obj.rclEdges:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (nodeA.edgeLevel or 0) < (nodeB.edgeLevel or 0) then
            									return -1;
            								elseif (nodeA.edgeLevel or 0) > (nodeB.edgeLevel or 0) then
            									return 1;
            								else   
            									return utils.compareStringPtBr(nodeA.edgeName, nodeB.edgeName);
            								end;
        end, obj);

    obj._e_event10 = obj.button9:addEventListener("onClick",
        function (self)
            self.rclFeats:append();
        end, obj);

    obj._e_event11 = obj.rclFeats:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (nodeA.featLevel or 0) < (nodeB.featLevel or 0) then
            									return -1;
            								elseif (nodeA.featLevel or 0) > (nodeB.featLevel or 0) then
            									return 1;
            								else   
            									return utils.compareStringPtBr(nodeA.featName, nodeB.featName);
            								end;
        end, obj);

    obj._e_event12 = obj.button10:addEventListener("onClick",
        function (self)
            self.rclClass:append();
        end, obj);

    obj._e_event13 = obj.rclClass:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (nodeA.classLevel or 0) < (nodeB.classLevel or 0) then
            									return -1;
            								elseif (nodeA.classLevel or 0) > (nodeB.classLevel or 0) then
            									return 1;
            								else   
            									return utils.compareStringPtBr(nodeA.className, nodeB.className);
            								end;
        end, obj);

    obj._e_event14 = obj.button11:addEventListener("onClick",
        function (self)
            self.rclBag:append();
        end, obj);

    obj._e_event15 = obj.button12:addEventListener("onClick",
        function (self)
            self.rclMoves:append();
        end, obj);

    obj._e_event16 = obj.button13:addEventListener("onClick",
        function (self)
            self.rclDex:append();
        end, obj);

    obj._e_event17 = obj.rclDex:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (nodeA.pokeNumber or 0) < (nodeB.pokeNumber or 0) then
            								return -1;
            							elseif (nodeA.pokeNumber or 0) > (nodeB.pokeNumber or 0) then
            								return 1;
            							else   
            								return utils.compareStringPtBr(nodeA.pokeSpecie, nodeB.pokeSpecie);
            							end;
        end, obj);

    obj._e_event18 = obj.rclDex:addEventListener("onItemAdded",
        function (self, node, form)
            self.recalcDex();
        end, obj);

    obj._e_event19 = obj.rclDex:addEventListener("onItemRemoved",
        function (self, node, form)
            self.recalcDex();
        end, obj);

    obj._e_event20 = obj.button14:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/nn4umeff9lp7ytm/PTU-TRN-SKJ.rpk?dl=0');
        end, obj);

    obj._e_event21 = obj.button15:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=137661');
        end, obj);

    obj._e_event22 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.bodyAcroLevel == "1") then
                sheet.bodyAcroDice = "1d6";
            
                elseif (sheet.bodyAcroLevel == "2") then
                sheet.bodyAcroDice = "2d6";
            
                elseif (sheet.bodyAcroLevel == "3") then
                sheet.bodyAcroDice = "3d6";
            
                elseif (sheet.bodyAcroLevel == "4") then
                sheet.bodyAcroDice = "4d6";
            
                elseif (sheet.bodyAcroLevel == "5") then
                sheet.bodyAcroDice = "5d6";
            
                elseif (sheet.bodyAcroLevel == "6") then
                sheet.bodyAcroDice = "6d6";
            
                else
                sheet.bodyAcroDice = "";
            
                end;
        end, obj);

    obj._e_event23 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.bodyAthleticsLevel == "1") then
                sheet.bodyAthleticsDice = "1d6";
            
                elseif (sheet.bodyAthleticsLevel == "2") then
                sheet.bodyAthleticsDice = "2d6";
            
                elseif (sheet.bodyAthleticsLevel == "3") then
                sheet.bodyAthleticsDice = "3d6";
            
                elseif (sheet.bodyAthleticsLevel == "4") then
                sheet.bodyAthleticsDice = "4d6";
            
                elseif (sheet.bodyAthleticsLevel == "5") then
                sheet.bodyAthleticsDice = "5d6";
            
                elseif (sheet.bodyAthleticsLevel == "6") then
                sheet.bodyAthleticsDice = "6d6";
            
                else
                sheet.bodyAthleticsDice = "";
            
                end;
        end, obj);

    obj._e_event24 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.bodyCombatLevel == "1") then
                sheet.bodyCombatDice = "1d6";
            
                elseif (sheet.bodyCombatLevel == "2") then
                sheet.bodyCombatDice = "2d6";
            
                elseif (sheet.bodyCombatLevel == "3") then
                sheet.bodyCombatDice = "3d6";
            
                elseif (sheet.bodyCombatLevel == "4") then
                sheet.bodyCombatDice = "4d6";
            
                elseif (sheet.bodyCombatLevel == "5") then
                sheet.bodyCombatDice = "5d6";
            
                elseif (sheet.bodyCombatLevel == "6") then
                sheet.bodyCombatDice = "6d6";
            
                else
                sheet.bodyCombatDice = "";
            
                end;
        end, obj);

    obj._e_event25 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.bodyStealthLevel == "1") then
                sheet.bodyStealthDice = "1d6";
            
                elseif (sheet.bodyStealthLevel == "2") then
                sheet.bodyStealthDice = "2d6";
            
                elseif (sheet.bodyStealthLevel == "3") then
                sheet.bodyStealthDice = "3d6";
            
                elseif (sheet.bodyStealthLevel == "4") then
                sheet.bodyStealthDice = "4d6";
            
                elseif (sheet.bodyStealthLevel == "5") then
                sheet.bodyStealthDice = "5d6";
            
                elseif (sheet.bodyStealthLevel == "6") then
                sheet.bodyStealthDice = "6d6";
            
                else
                sheet.bodyStealthDice = "";
            
                end;
        end, obj);

    obj._e_event26 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.bodyIntimidateLevel == "1") then
                sheet.bodyIntimidateDice = "1d6";
            
                elseif (sheet.bodyIntimidateLevel == "2") then
                sheet.bodyIntimidateDice = "2d6";
            
                elseif (sheet.bodyIntimidateLevel == "3") then
                sheet.bodyIntimidateDice = "3d6";
            
                elseif (sheet.bodyIntimidateLevel == "4") then
                sheet.bodyIntimidateDice = "4d6";
            
                elseif (sheet.bodyIntimidateLevel == "5") then
                sheet.bodyIntimidateDice = "5d6";
            
                elseif (sheet.bodyIntimidateLevel == "6") then
                sheet.bodyIntimidateDice = "6d6";
            
                else
                sheet.bodyIntimidateDice = "";
            
                end;
        end, obj);

    obj._e_event27 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.bodySurvivalLevel == "1") then
                sheet.bodySurvivalDice = "1d6";
            
                elseif (sheet.bodySurvivalLevel == "2") then
                sheet.bodySurvivalDice = "2d6";
            
                elseif (sheet.bodySurvivalLevel == "3") then
                sheet.bodySurvivalDice = "3d6";
            
                elseif (sheet.bodySurvivalLevel == "4") then
                sheet.bodySurvivalDice = "4d6";
            
                elseif (sheet.bodySurvivalLevel == "5") then
                sheet.bodySurvivalDice = "5d6";
            
                elseif (sheet.bodySurvivalLevel == "6") then
                sheet.bodySurvivalDice = "6d6";
            
                else
                sheet.bodySurvivalDice = "";
            
                end;
        end, obj);

    obj._e_event28 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.spiritCharmLevel == "1") then
                sheet.spiritCharmDice = "1d6";
            
                elseif (sheet.spiritCharmLevel == "2") then
                sheet.spiritCharmDice = "2d6";
            
                elseif (sheet.spiritCharmLevel == "3") then
                sheet.spiritCharmDice = "3d6";
            
                elseif (sheet.spiritCharmLevel == "4") then
                sheet.spiritCharmDice = "4d6";
            
                elseif (sheet.spiritCharmLevel == "5") then
                sheet.spiritCharmDice = "5d6";
            
                elseif (sheet.spiritCharmLevel == "6") then
                sheet.spiritCharmDice = "6d6";
            
                else
                sheet.spiritCharmDice = "";
            
                end;
        end, obj);

    obj._e_event29 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.spiritCommandLevel == "1") then
                sheet.spiritCommandDice = "1d6";
            
                elseif (sheet.spiritCommandLevel == "2") then
                sheet.spiritCommandDice = "2d6";
            
                elseif (sheet.spiritCommandLevel == "3") then
                sheet.spiritCommandDice = "3d6";
            
                elseif (sheet.spiritCommandLevel == "4") then
                sheet.spiritCommandDice = "4d6";
            
                elseif (sheet.spiritCommandLevel == "5") then
                sheet.spiritCommandDice = "5d6";
            
                elseif (sheet.spiritCommandLevel == "6") then
                sheet.spiritCommandDice = "6d6";
            
                else
                sheet.spiritCommandDice = "";
            
                end;
        end, obj);

    obj._e_event30 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.spiritFocusLevel == "1") then
                sheet.spiritFocusDice = "1d6";
            
                elseif (sheet.spiritFocusLevel == "2") then
                sheet.spiritFocusDice = "2d6";
            
                elseif (sheet.spiritFocusLevel == "3") then
                sheet.spiritFocusDice = "3d6";
            
                elseif (sheet.spiritFocusLevel == "4") then
                sheet.spiritFocusDice = "4d6";
            
                elseif (sheet.spiritFocusLevel == "5") then
                sheet.spiritFocusDice = "5d6";
            
                elseif (sheet.spiritFocusLevel == "6") then
                sheet.spiritFocusDice = "6d6";
            
                else
                sheet.spiritFocusDice = "";
            
                end;
        end, obj);

    obj._e_event31 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.spiritIntuitionLevel == "1") then
                sheet.spiritIntuitionDice = "1d6";
            
                elseif (sheet.spiritIntuitionLevel == "2") then
                sheet.spiritIntuitionDice = "2d6";
            
                elseif (sheet.spiritIntuitionLevel == "3") then
                sheet.spiritIntuitionDice = "3d6";
            
                elseif (sheet.spiritIntuitionLevel == "4") then
                sheet.spiritIntuitionDice = "4d6";
            
                elseif (sheet.spiritIntuitionLevel == "5") then
                sheet.spiritIntuitionDice = "5d6";
            
                elseif (sheet.spiritIntuitionLevel == "6") then
                sheet.spiritIntuitionDice = "6d6";
            
                else
                sheet.spiritIntuitionDice = "";
            
                end;
        end, obj);

    obj._e_event32 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.mindGenEdLevel == "1") then
                sheet.mindGenEdDice = "1d6";
            
                elseif (sheet.mindGenEdLevel == "2") then
                sheet.mindGenEdDice = "2d6";
            
                elseif (sheet.mindGenEdLevel == "3") then
                sheet.mindGenEdDice = "3d6";
            
                elseif (sheet.mindGenEdLevel == "4") then
                sheet.mindGenEdDice = "4d6";
            
                elseif (sheet.mindGenEdLevel == "5") then
                sheet.mindGenEdDice = "5d6";
            
                elseif (sheet.mindGenEdLevel == "6") then
                sheet.mindGenEdDice = "6d6";
            
                else
                sheet.mindGenEdDice = "";
            
                end;
        end, obj);

    obj._e_event33 = obj.dataLink12:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.mindMedEdLevel == "1") then
                sheet.mindMedEdDice = "1d6";
            
                elseif (sheet.mindMedEdLevel == "2") then
                sheet.mindMedEdDice = "2d6";
            
                elseif (sheet.mindMedEdLevel == "3") then
                sheet.mindMedEdDice = "3d6";
            
                elseif (sheet.mindMedEdLevel == "4") then
                sheet.mindMedEdDice = "4d6";
            
                elseif (sheet.mindMedEdLevel == "5") then
                sheet.mindMedEdDice = "5d6";
            
                elseif (sheet.mindMedEdLevel == "6") then
                sheet.mindMedEdDice = "6d6";
            
                else
                sheet.mindMedEdDice = "";
            
                end;
        end, obj);

    obj._e_event34 = obj.dataLink13:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.mindOccEdLevel == "1") then
                sheet.mindOccEdDice = "1d6";
            
                elseif (sheet.mindOccEdLevel == "2") then
                sheet.mindOccEdDice = "2d6";
            
                elseif (sheet.mindOccEdLevel == "3") then
                sheet.mindOccEdDice = "3d6";
            
                elseif (sheet.mindOccEdLevel == "4") then
                sheet.mindOccEdDice = "4d6";
            
                elseif (sheet.mindOccEdLevel == "5") then
                sheet.mindOccEdDice = "5d6";
            
                elseif (sheet.mindOccEdLevel == "6") then
                sheet.mindOccEdDice = "6d6";
            
                else
                sheet.mindOccEdDice = "";
            
                end;
        end, obj);

    obj._e_event35 = obj.dataLink14:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.mindPokeEdLevel == "1") then
                sheet.mindPokeEdDice = "1d6";
            
                elseif (sheet.mindPokeEdLevel == "2") then
                sheet.mindPokeEdDice = "2d6";
            
                elseif (sheet.mindPokeEdLevel == "3") then
                sheet.mindPokeEdDice = "3d6";
            
                elseif (sheet.mindPokeEdLevel == "4") then
                sheet.mindPokeEdDice = "4d6";
            
                elseif (sheet.mindPokeEdLevel == "5") then
                sheet.mindPokeEdDice = "5d6";
            
                elseif (sheet.mindPokeEdLevel == "6") then
                sheet.mindPokeEdDice = "6d6";
            
                else
                sheet.mindPokeEdDice = "";
            
                end;
        end, obj);

    obj._e_event36 = obj.dataLink15:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.mindtechEdLevel == "1") then
                sheet.mindtechEdDice = "1d6";
            
                elseif (sheet.mindtechEdLevel == "2") then
                sheet.mindtechEdDice = "2d6";
            
                elseif (sheet.mindtechEdLevel == "3") then
                sheet.mindtechEdDice = "3d6";
            
                elseif (sheet.mindtechEdLevel == "4") then
                sheet.mindtechEdDice = "4d6";
            
                elseif (sheet.mindtechEdLevel == "5") then
                sheet.mindtechEdDice = "5d6";
            
                elseif (sheet.mindtechEdLevel == "6") then
                sheet.mindtechEdDice = "6d6";
            
                else
                sheet.mindtechEdDice = "";
            
                end;
        end, obj);

    obj._e_event37 = obj.dataLink16:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.mindGuileLevel == "1") then
                sheet.mindGuileDice = "1d6";
            
                elseif (sheet.mindGuileLevel == "2") then
                sheet.mindGuileDice = "2d6";
            
                elseif (sheet.mindGuileLevel == "3") then
                sheet.mindGuileDice = "3d6";
            
                elseif (sheet.mindGuileLevel == "4") then
                sheet.mindGuileDice = "4d6";
            
                elseif (sheet.mindGuileLevel == "5") then
                sheet.mindGuileDice = "5d6";
            
                elseif (sheet.mindGuileLevel == "6") then
                sheet.mindGuileDice = "6d6";
            
                else
                sheet.mindGuileDice = "";
            
                end;
        end, obj);

    obj._e_event38 = obj.dataLink17:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.mindPercepLevel == "1") then
                sheet.mindPercepDice = "1d6";
            
                elseif (sheet.mindPercepLevel == "2") then
                sheet.mindPercepDice = "2d6";
            
                elseif (sheet.mindPercepLevel == "3") then
                sheet.mindPercepDice = "3d6";
            
                elseif (sheet.mindPercepLevel == "4") then
                sheet.mindPercepDice = "4d6";
            
                elseif (sheet.mindPercepLevel == "5") then
                sheet.mindPercepDice = "5d6";
            
                elseif (sheet.mindPercepLevel == "6") then
                sheet.mindPercepDice = "6d6";
            
                else
                sheet.mindPercepDice = "";
            
                end;
        end, obj);

    obj._e_event39 = obj.dataLink18:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.trainerOverland = math.floor((((sheet.bodyAcroLevel or 0) + (sheet.bodyAthleticsLevel or 0)) / 2) + 3);
                sheet.trainerSwim = math.floor(((((sheet.bodyAcroLevel or 0) + (sheet.bodyAthleticsLevel or 0)) / 2) + 3)/2);
                sheet.trainerJumpH = math.floor((sheet.bodyAcroLevel or 1) / 2);
                sheet.trainerThrow = math.floor((sheet.bodyAthleticsLevel or 1) + 4);
        end, obj);

    obj._e_event40 = obj.dataLink19:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.trainerMaxPV = math.floor(((sheet.trainerLevel or 1) * 2) + ((sheet.trainerHP or 1) * 3) + 10);
                sheet.trainerEvasion = math.floor((sheet.trainerDef or 1) /5);
                sheet.trainerSpEvasion = math.floor((sheet.trainerSpDef or 1) /5);
                sheet.trainerSpeedEvasion = math.floor((sheet.trainerSpeed or 1) /5);
        end, obj);

    obj._e_event41 = obj.dataLink20:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.bodyAthleticsLevel > "2") then
                powerIncA = 1;
                else
                powerIncA = 0;
                end;
            
                sheet.trainerPower = math.floor( (powerIncA or 0) + (powerIncC or 0) + 4);
        end, obj);

    obj._e_event42 = obj.dataLink21:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.bodyCombatLevel > "3") then
                powerIncC = 1;
                else
                powerIncC = 0;
                end;
            
                sheet.trainerPower = math.floor( (powerIncA or 0) + (powerIncC or 0) + 4);
        end, obj);

    obj._e_event43 = obj.dataLink22:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.bodyAcroLevel > "3") then
                sheet.trainerJumpV = 1;
                elseif (sheet.bodyAcroLevel > "5") then
                sheet.trainerJumpV = 2;
                else
                sheet.trainerJumpV = 0;
                end;
        end, obj);

    obj._e_event44 = obj.dataLink23:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.trainerTotalHP = sheet.trainerHP;
            	sheet.trainerAP = math.floor( 5 + ((sheet.trainerLevel or 1) / 5) );
            	sheet.fullPV = math.floor( ((sheet.trainerHP or 1) * 3) + ((sheet.trainerLevel or 1) * 2) + 10);
            	sheet.trainerMaxPV = math.floor(sheet.fullPV - ((sheet.fullPV / 10 ) * (sheet.trainerInjuriesQtd or 0)));
        end, obj);

    obj._e_event45 = obj.dataLink24:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.trainerCmbtStgAtk == "0") then
                sheet.trainerCmbtStgAtkVlr = 0.4;
                elseif (sheet.trainerCmbtStgAtk == "1") then
                sheet.trainerCmbtStgAtkVlr = 0.5;
                elseif (sheet.trainerCmbtStgAtk == "2") then
                sheet.trainerCmbtStgAtkVlr = 0.6;
                elseif (sheet.trainerCmbtStgAtk == "3") then
                sheet.trainerCmbtStgAtkVlr = 0.7;
                elseif (sheet.trainerCmbtStgAtk == "4") then
                sheet.trainerCmbtStgAtkVlr = 0.8;
                elseif (sheet.trainerCmbtStgAtk == "5") then
                sheet.trainerCmbtStgAtkVlr = 0.9;
                elseif (sheet.trainerCmbtStgAtk == "6") then
                sheet.trainerCmbtStgAtkVlr = 1;
                elseif (sheet.trainerCmbtStgAtk == "7") then
                sheet.trainerCmbtStgAtkVlr = 1.2;
                elseif (sheet.trainerCmbtStgAtk == "8") then
                sheet.trainerCmbtStgAtkVlr = 1.4;
                elseif (sheet.trainerCmbtStgAtk == "9") then
                sheet.trainerCmbtStgAtkVlr = 1.6;
                elseif (sheet.trainerCmbtStgAtk == "10") then
                sheet.trainerCmbtStgAtkVlr = 1.8;
                elseif (sheet.trainerCmbtStgAtk == "11") then
                sheet.trainerCmbtStgAtkVlr = 2;
                elseif (sheet.trainerCmbtStgAtk == "12") then
                sheet.trainerCmbtStgAtkVlr = 2.2;
                end;
            	sheet.trainerTotalAtk = math.floor((sheet.trainerAtk or 1) * (sheet.trainerCmbtStgAtkVlr or 1));
            	sheet.trainerDamagePhysical = sheet.trainerTotalAtk;
        end, obj);

    obj._e_event46 = obj.dataLink25:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.trainerCmbtStgDef == "0") then
                sheet.trainerCmbtStgDefVlr = 0.4;
                elseif (sheet.trainerCmbtStgDef == "1") then
                sheet.trainerCmbtStgDefVlr = 0.5;
                elseif (sheet.trainerCmbtStgDef == "2") then
                sheet.trainerCmbtStgDefVlr = 0.6;
                elseif (sheet.trainerCmbtStgDef == "3") then
                sheet.trainerCmbtStgDefVlr = 0.7;
                elseif (sheet.trainerCmbtStgDef == "4") then
                sheet.trainerCmbtStgDefVlr = 0.8;
                elseif (sheet.trainerCmbtStgDef == "5") then
                sheet.trainerCmbtStgDefVlr = 0.9;
                elseif (sheet.trainerCmbtStgDef == "6") then
                sheet.trainerCmbtStgDefVlr = 1;
                elseif (sheet.trainerCmbtStgDef == "7") then
                sheet.trainerCmbtStgDefVlr = 1.2;
                elseif (sheet.trainerCmbtStgDef == "8") then
                sheet.trainerCmbtStgDefVlr = 1.4;
                elseif (sheet.trainerCmbtStgDef == "9") then
                sheet.trainerCmbtStgDefVlr = 1.6;
                elseif (sheet.trainerCmbtStgDef == "10") then
                sheet.trainerCmbtStgDefVlr = 1.8;
                elseif (sheet.trainerCmbtStgDef == "11") then
                sheet.trainerCmbtStgDefVlr = 2;
                elseif (sheet.trainerCmbtStgDef == "12") then
                sheet.trainerCmbtStgDefVlr = 2.2;
                end;
            	sheet.trainerTotalDef = math.floor((sheet.trainerDef or 1) * (sheet.trainerCmbtStgDefVlr or 1));
            	sheet.trainerEvasion = math.floor(sheet.trainerTotalDef/5);
        end, obj);

    obj._e_event47 = obj.dataLink26:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.trainerCmbtStgSpeed == "0") then
                sheet.trainerCmbtStgSpeedVlr = 0.4;
                elseif (sheet.trainerCmbtStgSpeed == "1") then
                sheet.trainerCmbtStgSpeedVlr = 0.5;
                elseif (sheet.trainerCmbtStgSpeed == "2") then
                sheet.trainerCmbtStgSpeedVlr = 0.6;
                elseif (sheet.trainerCmbtStgSpeed == "3") then
                sheet.trainerCmbtStgSpeedVlr = 0.7;
                elseif (sheet.trainerCmbtStgSpeed == "4") then
                sheet.trainerCmbtStgSpeedVlr = 0.8;
                elseif (sheet.trainerCmbtStgSpeed == "5") then
                sheet.trainerCmbtStgSpeedVlr = 0.9;
                elseif (sheet.trainerCmbtStgSpeed == "6") then
                sheet.trainerCmbtStgSpeedVlr = 1;
                elseif (sheet.trainerCmbtStgSpeed == "7") then
                sheet.trainerCmbtStgSpeedVlr = 1.2;
                elseif (sheet.trainerCmbtStgSpeed == "8") then
                sheet.trainerCmbtStgSpeedVlr = 1.4;
                elseif (sheet.trainerCmbtStgSpeed == "9") then
                sheet.trainerCmbtStgSpeedVlr = 1.6;
                elseif (sheet.trainerCmbtStgSpeed == "10") then
                sheet.trainerCmbtStgSpeedVlr = 1.8;
                elseif (sheet.trainerCmbtStgSpeed == "11") then
                sheet.trainerCmbtStgSpeedVlr = 2;
                elseif (sheet.trainerCmbtStgSpeed == "12") then
                sheet.trainerCmbtStgSpeedVlr = 2.2;
                end;
            	sheet.trainerTotalSpeed = math.floor((sheet.trainerSpeed or 1)  * (sheet.trainerCmbtStgSpeedVlr or 1));
                sheet.trainerSpeedEvasion = math.floor(sheet.trainerTotalSpeed/5);
                sheet.trainerInitiative = sheet.trainerTotalSpeed;
        end, obj);

    obj._e_event48 = obj.dataLink27:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.trainerCmbtStgSpAtk == "0") then
                sheet.trainerCmbtStgSpAtkVlr = 0.4;
                elseif (sheet.trainerCmbtStgSpAtk == "1") then
                sheet.trainerCmbtStgSpAtkVlr = 0.5;
                elseif (sheet.trainerCmbtStgSpAtk == "2") then
                sheet.trainerCmbtStgSpAtkVlr = 0.6;
                elseif (sheet.trainerCmbtStgSpAtk == "3") then
                sheet.trainerCmbtStgSpAtkVlr = 0.7;
                elseif (sheet.trainerCmbtStgSpAtk == "4") then
                sheet.trainerCmbtStgSpAtkVlr = 0.8;
                elseif (sheet.trainerCmbtStgSpAtk == "5") then
                sheet.trainerCmbtStgSpAtkVlr = 0.9;
                elseif (sheet.trainerCmbtStgSpAtk == "6") then
                sheet.trainerCmbtStgSpAtkVlr = 1;
                elseif (sheet.trainerCmbtStgSpAtk == "7") then
                sheet.trainerCmbtStgSpAtkVlr = 1.2;
                elseif (sheet.trainerCmbtStgSpAtk == "8") then
                sheet.trainerCmbtStgSpAtkVlr = 1.4;
                elseif (sheet.trainerCmbtStgSpAtk == "9") then
                sheet.trainerCmbtStgSpAtkVlr = 1.6;
                elseif (sheet.trainerCmbtStgSpAtk == "10") then
                sheet.trainerCmbtStgSpAtkVlr = 1.8;
                elseif (sheet.trainerCmbtStgSpAtk == "11") then
                sheet.trainerCmbtStgSpAtkVlr = 2;
                elseif (sheet.trainerCmbtStgSpAtk == "12") then
                sheet.trainerCmbtStgSpAtkVlr = 2.2;
                end;
            	sheet.trainerTotalSpAtk = math.floor((sheet.trainerSpAtk or 1) * (sheet.trainerCmbtStgSpAtkVlr or 1));
            	sheet.trainerDamageSpecial = sheet.trainerTotalSpAtk;
        end, obj);

    obj._e_event49 = obj.dataLink28:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.trainerCmbtStgSpDef == "0") then
                sheet.trainerCmbtStgSpDefVlr = 0.4;
                elseif (sheet.trainerCmbtStgSpDef == "1") then
                sheet.trainerCmbtStgSpDefVlr = 0.5;
                elseif (sheet.trainerCmbtStgSpDef == "2") then
                sheet.trainerCmbtStgSpDefVlr = 0.6;
                elseif (sheet.trainerCmbtStgSpDef == "3") then
                sheet.trainerCmbtStgSpDefVlr = 0.7;
                elseif (sheet.trainerCmbtStgSpDef == "4") then
                sheet.trainerCmbtStgSpDefVlr = 0.8;
                elseif (sheet.trainerCmbtStgSpDef == "5") then
                sheet.trainerCmbtStgSpDefVlr = 0.9;
                elseif (sheet.trainerCmbtStgSpDef == "6") then
                sheet.trainerCmbtStgSpDefVlr = 1;
                elseif (sheet.trainerCmbtStgSpDef == "7") then
                sheet.trainerCmbtStgSpDefVlr = 1.2;
                elseif (sheet.trainerCmbtStgSpDef == "8") then
                sheet.trainerCmbtStgSpDefVlr = 1.4;
                elseif (sheet.trainerCmbtStgSpDef == "9") then
                sheet.trainerCmbtStgSpDefVlr = 1.6;
                elseif (sheet.trainerCmbtStgSpDef == "10") then
                sheet.trainerCmbtStgSpDefVlr = 1.8;
                elseif (sheet.trainerCmbtStgSpDef == "11") then
                sheet.trainerCmbtStgSpDefVlr = 2;
                elseif (sheet.trainerCmbtStgSpDef == "12") then
                sheet.trainerCmbtStgSpDefVlr = 2.2;
                end;
            	sheet.trainerTotalSpDef = math.floor((sheet.trainerSpDef or 1) * (sheet.trainerCmbtStgSpDefVlr or 1));
                sheet.trainerSpEvasion = math.floor(sheet.trainerTotalSpDef/5);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.rclDex ~= nil then self.rclDex:destroy(); self.rclDex = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.xpPopUp ~= nil then self.xpPopUp:destroy(); self.xpPopUp = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.statsSection1 ~= nil then self.statsSection1:destroy(); self.statsSection1 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.spAtkPopUp ~= nil then self.spAtkPopUp:destroy(); self.spAtkPopUp = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.statsLine1 ~= nil then self.statsLine1:destroy(); self.statsLine1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.spDefPopUp ~= nil then self.spDefPopUp:destroy(); self.spDefPopUp = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.spiritSection ~= nil then self.spiritSection:destroy(); self.spiritSection = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.secondSection ~= nil then self.secondSection:destroy(); self.secondSection = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.spdPopUp ~= nil then self.spdPopUp:destroy(); self.spdPopUp = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.defPopUp ~= nil then self.defPopUp:destroy(); self.defPopUp = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.rclEdges ~= nil then self.rclEdges:destroy(); self.rclEdges = nil; end;
        if self.rclBag ~= nil then self.rclBag:destroy(); self.rclBag = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.bodyLayout ~= nil then self.bodyLayout:destroy(); self.bodyLayout = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.topLayout ~= nil then self.topLayout:destroy(); self.topLayout = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.infoSection ~= nil then self.infoSection:destroy(); self.infoSection = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.hpPopUp ~= nil then self.hpPopUp:destroy(); self.hpPopUp = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.bodySection ~= nil then self.bodySection:destroy(); self.bodySection = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.secondStatRow ~= nil then self.secondStatRow:destroy(); self.secondStatRow = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.mindSection ~= nil then self.mindSection:destroy(); self.mindSection = nil; end;
        if self.rclFeats ~= nil then self.rclFeats:destroy(); self.rclFeats = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.statsLine2 ~= nil then self.statsLine2:destroy(); self.statsLine2 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.firstSection ~= nil then self.firstSection:destroy(); self.firstSection = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rclMoves ~= nil then self.rclMoves:destroy(); self.rclMoves = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.rclClass ~= nil then self.rclClass:destroy(); self.rclClass = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.capacitySection ~= nil then self.capacitySection:destroy(); self.capacitySection = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.firstStatRow ~= nil then self.firstStatRow:destroy(); self.firstStatRow = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.atkPopUp ~= nil then self.atkPopUp:destroy(); self.atkPopUp = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.imageSection ~= nil then self.imageSection:destroy(); self.imageSection = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.trainerIDPopUp ~= nil then self.trainerIDPopUp:destroy(); self.trainerIDPopUp = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.stats ~= nil then self.stats:destroy(); self.stats = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmPtuTrainer = {
    newEditor = newfrmPtuTrainer, 
    new = newfrmPtuTrainer, 
    name = "frmPtuTrainer", 
    dataType = "br.com.shakerskj.ptu_trn", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "PTU Trainer Sheet", 
    description=""};

frmPtuTrainer = _frmPtuTrainer;
rrpg.registrarForm(_frmPtuTrainer);
rrpg.registrarDataType(_frmPtuTrainer);

return _frmPtuTrainer;
