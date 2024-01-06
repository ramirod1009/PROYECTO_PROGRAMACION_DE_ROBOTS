MODULE Module1
        CONST robtarget NewIni:=[[577.89485234,0,512.371659812],[0.499999865,0,0.866025482,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget NewAtaq:=[[609.844394291,0,319.671174559],[0.430026102,0,0.902816455,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Cogerte_Cascos:=[[572.555351259,25,125],[0,1,0,0],[0,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Soltar_Cascos:=[[25,-450,125],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Cogerte_Raton:=[[565,15,75],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Soltar_Mouse:=[[65,465,75],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!***********************************************************
    !
    ! M?dulo:  Module1
    !
    ! Descripción:
    !   <Introduzca la descripción aquí>
    !
    ! Autor: nikos
    !
    ! Versión: 1.0
    !
    !***********************************************************
    
    
    !***********************************************************
    !
    ! Procedimiento Main
    !
    !   Este es el punto de entrada de su programa
    !
    !***********************************************************
    PROC main()
        WHILE TRUE DO 
        SetDO Mouse_Outpu1, 0;
        SetDO Mouse_Output2, 1;
        
        MoveL NewIni,v1000,fine,Gripper\WObj:=WO_themainone;
        MoveJ NewAtaq,v1000,fine,Gripper\WObj:=WO_themainone;
        
        WaitDI Mouse_Input, 1;
        !WaitDI (Mouse_Input OR Headphones_Input);
        IF Headphones_Input = 0 THEN
            MoveL Cogerte_Raton,v1000,fine,Gripper\WObj:=WO_themainone;
            SetDO Mouse_Output2, 0;
            SetDO Mouse_Outpu1, 1;
            MoveJ NewIni,v1000,fine,Gripper\WObj:=WO_themainone;
            MoveL Soltar_Mouse,v1000,fine,Gripper\WObj:=WO_themainone;
            SetDO Mouse_Outpu1, 0;
            SetDO Mouse_Output2, 1;
            MoveJ NewIni,v1000,fine,Gripper\WObj:=WO_themainone;
        ELSE
            MoveL Cogerte_Cascos,v1000,fine,Gripper\WObj:=WO_themainone;
            SetDO Mouse_Output2, 0;
            SetDO Mouse_Outpu1, 1;
            MoveJ NewIni,v1000,fine,Gripper\WObj:=WO_themainone;
            MoveL Soltar_Cascos,v1000,fine,Gripper\WObj:=WO_themainone;
            SetDO Mouse_Outpu1, 0;
            SetDO Mouse_Output2, 1;
            MoveJ NewIni,v1000,fine,Gripper\WObj:=WO_themainone;
            
        ENDIF
        
        ENDWHILE
    ENDPROC
ENDMODULE