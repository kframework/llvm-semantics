; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/zerosInInits.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, i32*, [2 x i32], %struct.anon }
%struct.anon = type { i32* }

@main.a1 = internal unnamed_addr constant [3 x i8] c"\01\00\00", align 1
@main.a2 = internal unnamed_addr constant [3 x float] [float 1.000000e+00, float 2.000000e+00, float 0.000000e+00], align 4
@main.a4 = internal unnamed_addr constant [3 x i32] [i32 1, i32 0, i32 0], align 4
@main.a5 = internal unnamed_addr constant %0 { i32 1, i32* null, [2 x i32] [i32 0, i32 1], %struct.anon zeroinitializer }, align 8

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a1 = alloca [3 x i8], align 1
  %a2 = alloca [3 x float], align 4
  %a3 = alloca [3 x i32*], align 16
  %a4 = alloca [3 x i32], align 4
  %a5 = alloca %0, align 8
  store i32 0, i32* %retval
  %tmp = bitcast [3 x i8]* %a1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds ([3 x i8]* @main.a1, i32 0, i32 0), i64 3, i32 1, i1 false)
  %tmp2 = bitcast [3 x float]* %a2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([3 x float]* @main.a2 to i8*), i64 12, i32 4, i1 false)
  %.array = getelementptr inbounds [3 x i32*]* %a3, i32 0, i32 0
  %arrayidx = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 3
  %0 = bitcast i8* %arrayidx to i32*
  store i32* %0, i32** %.array
  %.array4 = getelementptr inbounds [3 x i32*]* %a3, i32 0, i32 1
  store i32* null, i32** %.array4
  %.array5 = getelementptr inbounds [3 x i32*]* %a3, i32 0, i32 2
  store i32* null, i32** %.array5
  %tmp7 = bitcast [3 x i32]* %a4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp7, i8* bitcast ([3 x i32]* @main.a4 to i8*), i64 12, i32 4, i1 false)
  %tmp9 = bitcast %0* %a5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp9, i8* bitcast (%0* @main.a5 to i8*), i64 32, i32 8, i1 false)
  %arrayidx10 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 0
  %tmp11 = load i8* %arrayidx10, align 1
  %conv = sext i8 %tmp11 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %arrayidx13 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 1
  %tmp14 = load i8* %arrayidx13, align 1
  %conv15 = sext i8 %tmp14 to i32
  %cmp16 = icmp ne i32 %conv15, 0
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end
  store i32 2, i32* %retval
  br label %return

if.end19:                                         ; preds = %if.end
  %arrayidx20 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 2
  %tmp21 = load i8* %arrayidx20, align 1
  %conv22 = sext i8 %tmp21 to i32
  %cmp23 = icmp ne i32 %conv22, 0
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end19
  store i32 3, i32* %retval
  br label %return

if.end26:                                         ; preds = %if.end19
  %arrayidx27 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 0
  %tmp28 = load float* %arrayidx27, align 4
  %cmp29 = fcmp une float %tmp28, 1.000000e+00
  br i1 %cmp29, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end26
  store i32 4, i32* %retval
  br label %return

if.end32:                                         ; preds = %if.end26
  %arrayidx33 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 1
  %tmp34 = load float* %arrayidx33, align 4
  %conv35 = fpext float %tmp34 to double
  %cmp36 = fcmp une double %conv35, 2.000000e+00
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end32
  store i32 5, i32* %retval
  br label %return

if.end39:                                         ; preds = %if.end32
  %arrayidx40 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 2
  %tmp41 = load float* %arrayidx40, align 4
  %cmp42 = fcmp une float %tmp41, 0.000000e+00
  br i1 %cmp42, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.end39
  store i32 6, i32* %retval
  br label %return

if.end45:                                         ; preds = %if.end39
  %arrayidx46 = getelementptr inbounds [3 x i32*]* %a3, i32 0, i64 0
  %tmp47 = load i32** %arrayidx46, align 8
  %arrayidx48 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 3
  %1 = ptrtoint i8* %arrayidx48 to i64
  %2 = inttoptr i64 %1 to i32*
  %cmp49 = icmp ne i32* %tmp47, %2
  br i1 %cmp49, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end45
  store i32 7, i32* %retval
  br label %return

if.end52:                                         ; preds = %if.end45
  %arrayidx53 = getelementptr inbounds [3 x i32*]* %a3, i32 0, i64 1
  %tmp54 = load i32** %arrayidx53, align 8
  %cmp55 = icmp ne i32* %tmp54, null
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end52
  store i32 8, i32* %retval
  br label %return

if.end58:                                         ; preds = %if.end52
  %arrayidx59 = getelementptr inbounds [3 x i32*]* %a3, i32 0, i64 2
  %tmp60 = load i32** %arrayidx59, align 8
  %cmp61 = icmp ne i32* %tmp60, null
  br i1 %cmp61, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end58
  store i32 9, i32* %retval
  br label %return

if.end64:                                         ; preds = %if.end58
  %arrayidx65 = getelementptr inbounds [3 x i32]* %a4, i32 0, i64 0
  %tmp66 = load i32* %arrayidx65, align 4
  %cmp67 = icmp ne i32 %tmp66, 1
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.end64
  store i32 10, i32* %retval
  br label %return

if.end70:                                         ; preds = %if.end64
  %arrayidx71 = getelementptr inbounds [3 x i32]* %a4, i32 0, i64 1
  %tmp72 = load i32* %arrayidx71, align 4
  %cmp73 = icmp ne i32 %tmp72, 0
  br i1 %cmp73, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end70
  store i32 11, i32* %retval
  br label %return

if.end76:                                         ; preds = %if.end70
  %arrayidx77 = getelementptr inbounds [3 x i32]* %a4, i32 0, i64 2
  %tmp78 = load i32* %arrayidx77, align 4
  %cmp79 = icmp ne i32 %tmp78, 0
  br i1 %cmp79, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.end76
  store i32 12, i32* %retval
  br label %return

if.end82:                                         ; preds = %if.end76
  %arrayidx83 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 0
  %tmp84 = load float* %arrayidx83, align 4
  %cmp85 = fcmp une float %tmp84, 1.000000e+00
  br i1 %cmp85, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end82
  store i32 13, i32* %retval
  br label %return

if.end88:                                         ; preds = %if.end82
  %arrayidx89 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 1
  %tmp90 = load float* %arrayidx89, align 4
  %cmp91 = fcmp une float %tmp90, 2.000000e+00
  br i1 %cmp91, label %if.then93, label %if.end94

if.then93:                                        ; preds = %if.end88
  store i32 14, i32* %retval
  br label %return

if.end94:                                         ; preds = %if.end88
  %arrayidx95 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 2
  %tmp96 = load float* %arrayidx95, align 4
  %conv97 = fpext float %tmp96 to double
  %cmp98 = fcmp une double %conv97, 0.000000e+00
  br i1 %cmp98, label %if.then100, label %if.end101

if.then100:                                       ; preds = %if.end94
  store i32 15, i32* %retval
  br label %return

if.end101:                                        ; preds = %if.end94
  %a = getelementptr inbounds %0* %a5, i32 0, i32 0
  %tmp102 = load i32* %a, align 4
  %conv103 = sitofp i32 %tmp102 to float
  %cmp104 = fcmp une float %conv103, 1.000000e+00
  br i1 %cmp104, label %if.then106, label %if.end107

if.then106:                                       ; preds = %if.end101
  store i32 16, i32* %retval
  br label %return

if.end107:                                        ; preds = %if.end101
  %a108 = getelementptr inbounds %0* %a5, i32 0, i32 0
  %tmp109 = load i32* %a108, align 4
  %cmp110 = icmp ne i32 %tmp109, 1
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %if.end107
  store i32 17, i32* %retval
  br label %return

if.end113:                                        ; preds = %if.end107
  %b = getelementptr inbounds %0* %a5, i32 0, i32 1
  %tmp114 = load i32** %b, align 8
  %cmp115 = icmp ne i32* %tmp114, null
  br i1 %cmp115, label %if.then117, label %if.end118

if.then117:                                       ; preds = %if.end113
  store i32 18, i32* %retval
  br label %return

if.end118:                                        ; preds = %if.end113
  %b119 = getelementptr inbounds %0* %a5, i32 0, i32 1
  %tmp120 = load i32** %b119, align 8
  %cmp121 = icmp ne i32* %tmp120, null
  br i1 %cmp121, label %if.then123, label %if.end124

if.then123:                                       ; preds = %if.end118
  store i32 19, i32* %retval
  br label %return

if.end124:                                        ; preds = %if.end118
  %c = getelementptr inbounds %0* %a5, i32 0, i32 2
  %arrayidx125 = getelementptr inbounds [2 x i32]* %c, i32 0, i64 0
  %tmp126 = load i32* %arrayidx125, align 4
  %conv127 = sitofp i32 %tmp126 to double
  %cmp128 = fcmp une double %conv127, 0.000000e+00
  br i1 %cmp128, label %if.then130, label %if.end131

if.then130:                                       ; preds = %if.end124
  store i32 21, i32* %retval
  br label %return

if.end131:                                        ; preds = %if.end124
  %c132 = getelementptr inbounds %0* %a5, i32 0, i32 2
  %arrayidx133 = getelementptr inbounds [2 x i32]* %c132, i32 0, i64 0
  %tmp134 = load i32* %arrayidx133, align 4
  %cmp135 = icmp ne i32 %tmp134, 0
  br i1 %cmp135, label %if.then137, label %if.end138

if.then137:                                       ; preds = %if.end131
  store i32 22, i32* %retval
  br label %return

if.end138:                                        ; preds = %if.end131
  %c139 = getelementptr inbounds %0* %a5, i32 0, i32 2
  %arrayidx140 = getelementptr inbounds [2 x i32]* %c139, i32 0, i64 1
  %tmp141 = load i32* %arrayidx140, align 4
  %cmp142 = icmp ne i32 %tmp141, 1
  br i1 %cmp142, label %if.then144, label %if.end145

if.then144:                                       ; preds = %if.end138
  store i32 23, i32* %retval
  br label %return

if.end145:                                        ; preds = %if.end138
  %d = getelementptr inbounds %0* %a5, i32 0, i32 3
  %da = getelementptr inbounds %struct.anon* %d, i32 0, i32 0
  %tmp146 = load i32** %da, align 8
  %cmp147 = icmp ne i32* %tmp146, null
  br i1 %cmp147, label %if.then149, label %if.end150

if.then149:                                       ; preds = %if.end145
  store i32 24, i32* %retval
  br label %return

if.end150:                                        ; preds = %if.end145
  %d151 = getelementptr inbounds %0* %a5, i32 0, i32 3
  %da152 = getelementptr inbounds %struct.anon* %d151, i32 0, i32 0
  %tmp153 = load i32** %da152, align 8
  %cmp154 = icmp ne i32* %tmp153, null
  br i1 %cmp154, label %if.then156, label %if.end157

if.then156:                                       ; preds = %if.end150
  store i32 25, i32* %retval
  br label %return

if.end157:                                        ; preds = %if.end150
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end157, %if.then156, %if.then149, %if.then144, %if.then137, %if.then130, %if.then123, %if.then117, %if.then112, %if.then106, %if.then100, %if.then93, %if.then87, %if.then81, %if.then75, %if.then69, %if.then63, %if.then57, %if.then51, %if.then44, %if.then38, %if.then31, %if.then25, %if.then18, %if.then
  %3 = load i32* %retval
  ret i32 %3
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
