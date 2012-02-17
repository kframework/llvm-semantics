; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000689.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant [10 x [7 x i16]] [[7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074]], align 16
@g_5 = global i32 6, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_4[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][5] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][6] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][1] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][2] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][3] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][4] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][5] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][6] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][2] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][3] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][4] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][5] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][6] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][1] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][2] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][3] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][4] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][5] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][6] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][0] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][1] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][2] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][3] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][4] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][5] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][6] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][0] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][1] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][2] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][3] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][4] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][5] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][6] = %d\0A\00", align 1
@.str49 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][0] = %d\0A\00", align 1
@.str50 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][1] = %d\0A\00", align 1
@.str51 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][2] = %d\0A\00", align 1
@.str52 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][3] = %d\0A\00", align 1
@.str53 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][4] = %d\0A\00", align 1
@.str54 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][5] = %d\0A\00", align 1
@.str55 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][6] = %d\0A\00", align 1
@.str56 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][0] = %d\0A\00", align 1
@.str57 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][1] = %d\0A\00", align 1
@.str58 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][2] = %d\0A\00", align 1
@.str59 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][3] = %d\0A\00", align 1
@.str60 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][4] = %d\0A\00", align 1
@.str61 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][5] = %d\0A\00", align 1
@.str62 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][6] = %d\0A\00", align 1
@.str63 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][0] = %d\0A\00", align 1
@.str64 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][1] = %d\0A\00", align 1
@.str65 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][2] = %d\0A\00", align 1
@.str66 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][3] = %d\0A\00", align 1
@.str67 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][4] = %d\0A\00", align 1
@.str68 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][5] = %d\0A\00", align 1
@.str69 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][6] = %d\0A\00", align 1
@.str70 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %tmp4 = load i32* @g_5, align 4
  %conv6 = trunc i32 %tmp4 to i16
  ret i16 %conv6
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 18074) nounwind
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 18074) nounwind
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 18074) nounwind
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 18074) nounwind
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 18074) nounwind
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 18074) nounwind
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 18074) nounwind
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 18074) nounwind
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 18074) nounwind
  %call28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 18074) nounwind
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i64 0, i64 0), i32 18074) nounwind
  %call34 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i64 0, i64 0), i32 18074) nounwind
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i64 0, i64 0), i32 18074) nounwind
  %call40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i64 0, i64 0), i32 18074) nounwind
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i64 0, i64 0), i32 18074) nounwind
  %call46 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i64 0, i64 0), i32 18074) nounwind
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i64 0, i64 0), i32 18074) nounwind
  %call52 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i64 0, i64 0), i32 18074) nounwind
  %call55 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i64 0, i64 0), i32 18074) nounwind
  %call58 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i64 0, i64 0), i32 18074) nounwind
  %call61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i64 0, i64 0), i32 18074) nounwind
  %call64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i64 0, i64 0), i32 18074) nounwind
  %call67 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i64 0, i64 0), i32 18074) nounwind
  %call70 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i64 0, i64 0), i32 18074) nounwind
  %call73 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i64 0, i64 0), i32 18074) nounwind
  %call76 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i64 0, i64 0), i32 18074) nounwind
  %call79 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i64 0, i64 0), i32 18074) nounwind
  %call82 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i64 0, i64 0), i32 18074) nounwind
  %call85 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i64 0, i64 0), i32 18074) nounwind
  %call88 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i64 0, i64 0), i32 18074) nounwind
  %call91 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i64 0, i64 0), i32 18074) nounwind
  %call94 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i64 0, i64 0), i32 18074) nounwind
  %call97 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i64 0, i64 0), i32 18074) nounwind
  %call100 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i64 0, i64 0), i32 18074) nounwind
  %call103 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i64 0, i64 0), i32 18074) nounwind
  %call106 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i64 0, i64 0), i32 18074) nounwind
  %call109 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i64 0, i64 0), i32 18074) nounwind
  %call112 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i64 0, i64 0), i32 18074) nounwind
  %call115 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i64 0, i64 0), i32 18074) nounwind
  %call118 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i64 0, i64 0), i32 18074) nounwind
  %call121 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i64 0, i64 0), i32 18074) nounwind
  %call124 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i64 0, i64 0), i32 18074) nounwind
  %call127 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str42, i64 0, i64 0), i32 18074) nounwind
  %call130 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str43, i64 0, i64 0), i32 18074) nounwind
  %call133 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str44, i64 0, i64 0), i32 18074) nounwind
  %call136 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str45, i64 0, i64 0), i32 18074) nounwind
  %call139 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i64 0, i64 0), i32 18074) nounwind
  %call142 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str47, i64 0, i64 0), i32 18074) nounwind
  %call145 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str48, i64 0, i64 0), i32 18074) nounwind
  %call148 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str49, i64 0, i64 0), i32 18074) nounwind
  %call151 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str50, i64 0, i64 0), i32 18074) nounwind
  %call154 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str51, i64 0, i64 0), i32 18074) nounwind
  %call157 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str52, i64 0, i64 0), i32 18074) nounwind
  %call160 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str53, i64 0, i64 0), i32 18074) nounwind
  %call163 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str54, i64 0, i64 0), i32 18074) nounwind
  %call166 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str55, i64 0, i64 0), i32 18074) nounwind
  %call169 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str56, i64 0, i64 0), i32 18074) nounwind
  %call172 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str57, i64 0, i64 0), i32 18074) nounwind
  %call175 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str58, i64 0, i64 0), i32 18074) nounwind
  %call178 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str59, i64 0, i64 0), i32 18074) nounwind
  %call181 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str60, i64 0, i64 0), i32 18074) nounwind
  %call184 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str61, i64 0, i64 0), i32 18074) nounwind
  %call187 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str62, i64 0, i64 0), i32 18074) nounwind
  %call190 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str63, i64 0, i64 0), i32 18074) nounwind
  %call193 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str64, i64 0, i64 0), i32 18074) nounwind
  %call196 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str65, i64 0, i64 0), i32 18074) nounwind
  %call199 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str66, i64 0, i64 0), i32 18074) nounwind
  %call202 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str67, i64 0, i64 0), i32 18074) nounwind
  %call205 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str68, i64 0, i64 0), i32 18074) nounwind
  %call208 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str69, i64 0, i64 0), i32 18074) nounwind
  %call211 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i64 0, i64 0), i32 18074) nounwind
  %tmp212 = load i32* @g_5, align 4
  %call213 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str70, i64 0, i64 0), i32 %tmp212) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
