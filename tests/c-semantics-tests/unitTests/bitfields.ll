; ModuleID = '/home/david/src/c-semantics/tests/unitTests/bitfields.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bfs = type <{ i8, i8, i8, i8, [2 x i8], i8, i8, [2 x i8], [2 x i8], [2 x i8], [2 x i8], i8, [3 x i8] }>

@s = common global %struct.bfs zeroinitializer, align 4
@p = global %struct.bfs* @s, align 8
@.str = private unnamed_addr constant [9 x i8] c"BUG: a0\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"BUG: a1\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"BUG: a2\0A\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"BUG: a3\0A\00", align 1
@.str4 = private unnamed_addr constant [16 x i8] c"byte interp OK\0A\00", align 1
@.str5 = private unnamed_addr constant [13 x i8] c"BUG: a4: %d\0A\00", align 1
@.str6 = private unnamed_addr constant [9 x i8] c"BUG: a5\0A\00", align 1
@.str7 = private unnamed_addr constant [9 x i8] c"BUG: a6\0A\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"BUG: b0\0A\00", align 1
@.str9 = private unnamed_addr constant [9 x i8] c"BUG: b1\0A\00", align 1
@.str10 = private unnamed_addr constant [9 x i8] c"BUG: b2\0A\00", align 1
@.str11 = private unnamed_addr constant [9 x i8] c"BUG: b3\0A\00", align 1
@.str12 = private unnamed_addr constant [9 x i8] c"BUG: b4\0A\00", align 1
@.str13 = private unnamed_addr constant [13 x i8] c"BUG: b5: %d\0A\00", align 1
@.str14 = private unnamed_addr constant [9 x i8] c"BUG: b6\0A\00", align 1
@.str15 = private unnamed_addr constant [9 x i8] c"BUG: d0\0A\00", align 1
@.str16 = private unnamed_addr constant [9 x i8] c"BUG: d1\0A\00", align 1
@.str17 = private unnamed_addr constant [13 x i8] c"BUG: d2: %d\0A\00", align 1
@.str18 = private unnamed_addr constant [9 x i8] c"BUG: d3\0A\00", align 1
@.str19 = private unnamed_addr constant [9 x i8] c"BUG: e0\0A\00", align 1
@.str20 = private unnamed_addr constant [9 x i8] c"BUG: e1\0A\00", align 1
@.str21 = private unnamed_addr constant [17 x i8] c"short interp OK\0A\00", align 1
@.str22 = private unnamed_addr constant [13 x i8] c"BUG: e2: %d\0A\00", align 1
@.str23 = private unnamed_addr constant [9 x i8] c"BUG: e3\0A\00", align 1
@.str24 = private unnamed_addr constant [9 x i8] c"BUG: f0\0A\00", align 1
@.str25 = private unnamed_addr constant [9 x i8] c"BUG: f1\0A\00", align 1
@.str26 = private unnamed_addr constant [9 x i8] c"BUG: f2\0A\00", align 1
@.str27 = private unnamed_addr constant [4 x i8] c"ok\0A\00", align 1
@.str28 = private unnamed_addr constant [13 x i8] c"BUG: e3: %d\0A\00", align 1
@.str29 = private unnamed_addr constant [9 x i8] c"BUG: f4\0A\00", align 1
@.str30 = private unnamed_addr constant [15 x i8] c"BUG: i0a : %d\0A\00", align 1
@.str31 = private unnamed_addr constant [15 x i8] c"BUG: i0b : %d\0A\00", align 1
@.str32 = private unnamed_addr constant [15 x i8] c"BUG: i1a : %d\0A\00", align 1
@.str33 = private unnamed_addr constant [15 x i8] c"BUG: i1b : %d\0A\00", align 1
@.str34 = private unnamed_addr constant [15 x i8] c"BUG: i2a : %d\0A\00", align 1
@.str35 = private unnamed_addr constant [15 x i8] c"BUG: i2b : %d\0A\00", align 1
@.str36 = private unnamed_addr constant [18 x i8] c"BUG: i4 : %d, %d\0A\00", align 1
@.str37 = private unnamed_addr constant [14 x i8] c"BUG: k0 : %d\0A\00", align 1
@.str38 = private unnamed_addr constant [14 x i8] c"BUG: k1 : %d\0A\00", align 1
@.str39 = private unnamed_addr constant [14 x i8] c"BUG: k2 : %d\0A\00", align 1
@.str40 = private unnamed_addr constant [14 x i8] c"BUG: k3 : %d\0A\00", align 1
@.str41 = private unnamed_addr constant [18 x i8] c"BUG: k4 : %d, %d\0A\00", align 1
@.str42 = private unnamed_addr constant [15 x i8] c"finished ones\0A\00", align 1
@.str43 = private unnamed_addr constant [15 x i8] c"finished twos\0A\00", align 1
@.str44 = private unnamed_addr constant [17 x i8] c"finished eights\0A\00", align 1
@.str45 = private unnamed_addr constant [19 x i8] c"finished sixteens\0A\00", align 1
@.str46 = private unnamed_addr constant [18 x i8] c"finished partial\0A\00", align 1
@.str47 = private unnamed_addr constant [27 x i8] c"finished just big partial\0A\00", align 1
@.str48 = private unnamed_addr constant [22 x i8] c"finished big partial\0A\00", align 1

define i32 @testOnes() nounwind uwtable {
entry:
  %firstChar = alloca i8, align 1
  %0 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %1 = and i32 %0, -2
  store i32 %1, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %2 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %3 = and i32 %2, -3
  store i32 %3, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %4 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %5 = and i32 %4, -5
  store i32 %5, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %6 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %7 = and i32 %6, -9
  store i32 %7, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %8 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %9 = and i32 %8, -17
  store i32 %9, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %10 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %11 = and i32 %10, -33
  store i32 %11, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %12 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %13 = and i32 %12, -65
  store i32 %13, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %14 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %15 = and i32 %14, -129
  store i32 %15, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %16 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %bf.clear = and i32 %16, 1
  %cmp = icmp ne i32 %bf.clear, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %17 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %18 = lshr i32 %17, 1
  %bf.clear1 = and i32 %18, 1
  %cmp2 = icmp ne i32 %bf.clear1, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %19 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %20 = lshr i32 %19, 2
  %bf.clear6 = and i32 %20, 1
  %cmp7 = icmp ne i32 %bf.clear6, 0
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end5
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end5
  %21 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %22 = lshr i32 %21, 3
  %bf.clear11 = and i32 %22, 1
  %cmp12 = icmp ne i32 %bf.clear11, 0
  br i1 %cmp12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end10
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end10
  %23 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %24 = lshr i32 %23, 4
  %bf.clear16 = and i32 %24, 1
  %cmp17 = icmp ne i32 %bf.clear16, 0
  br i1 %cmp17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.end15
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.end15
  %25 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %26 = lshr i32 %25, 5
  %bf.clear21 = and i32 %26, 1
  %cmp22 = icmp ne i32 %bf.clear21, 0
  br i1 %cmp22, label %if.then23, label %if.end25

if.then23:                                        ; preds = %if.end20
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end25

if.end25:                                         ; preds = %if.then23, %if.end20
  %27 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %28 = lshr i32 %27, 6
  %bf.clear26 = and i32 %28, 1
  %cmp27 = icmp ne i32 %bf.clear26, 0
  br i1 %cmp27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end25
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.end25
  %29 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %30 = lshr i32 %29, 7
  %bf.clear31 = and i32 %30, 1
  %cmp32 = icmp ne i32 %bf.clear31, 0
  br i1 %cmp32, label %if.then33, label %if.end35

if.then33:                                        ; preds = %if.end30
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %if.end30
  %31 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %32 = and i32 %31, -2
  %33 = or i32 %32, 1
  store i32 %33, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %34 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %35 = and i32 %34, -3
  %36 = or i32 %35, 2
  store i32 %36, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %37 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %38 = and i32 %37, -5
  %39 = or i32 %38, 4
  store i32 %39, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %40 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %41 = and i32 %40, -9
  %42 = or i32 %41, 8
  store i32 %42, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %43 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %44 = and i32 %43, -17
  %45 = or i32 %44, 16
  store i32 %45, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %46 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %47 = and i32 %46, -33
  %48 = or i32 %47, 32
  store i32 %48, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %49 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %50 = and i32 %49, -65
  %51 = or i32 %50, 64
  store i32 %51, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %52 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %53 = and i32 %52, -129
  %54 = or i32 %53, 128
  store i32 %54, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %55 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %bf.clear36 = and i32 %55, 1
  %cmp37 = icmp ne i32 %bf.clear36, 1
  br i1 %cmp37, label %if.then38, label %if.end40

if.then38:                                        ; preds = %if.end35
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %if.end35
  %56 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %57 = lshr i32 %56, 1
  %bf.clear41 = and i32 %57, 1
  %cmp42 = icmp ne i32 %bf.clear41, 1
  br i1 %cmp42, label %if.then43, label %if.end45

if.then43:                                        ; preds = %if.end40
  %call44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end45

if.end45:                                         ; preds = %if.then43, %if.end40
  %58 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %59 = lshr i32 %58, 2
  %bf.clear46 = and i32 %59, 1
  %cmp47 = icmp ne i32 %bf.clear46, 1
  br i1 %cmp47, label %if.then48, label %if.end50

if.then48:                                        ; preds = %if.end45
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end50

if.end50:                                         ; preds = %if.then48, %if.end45
  %60 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %61 = lshr i32 %60, 3
  %bf.clear51 = and i32 %61, 1
  %cmp52 = icmp ne i32 %bf.clear51, 1
  br i1 %cmp52, label %if.then53, label %if.end55

if.then53:                                        ; preds = %if.end50
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end55

if.end55:                                         ; preds = %if.then53, %if.end50
  %62 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %63 = lshr i32 %62, 4
  %bf.clear56 = and i32 %63, 1
  %cmp57 = icmp ne i32 %bf.clear56, 1
  br i1 %cmp57, label %if.then58, label %if.end60

if.then58:                                        ; preds = %if.end55
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end60

if.end60:                                         ; preds = %if.then58, %if.end55
  %64 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %65 = lshr i32 %64, 5
  %bf.clear61 = and i32 %65, 1
  %cmp62 = icmp ne i32 %bf.clear61, 1
  br i1 %cmp62, label %if.then63, label %if.end65

if.then63:                                        ; preds = %if.end60
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end65

if.end65:                                         ; preds = %if.then63, %if.end60
  %66 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %67 = lshr i32 %66, 6
  %bf.clear66 = and i32 %67, 1
  %cmp67 = icmp ne i32 %bf.clear66, 1
  br i1 %cmp67, label %if.then68, label %if.end70

if.then68:                                        ; preds = %if.end65
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end70

if.end70:                                         ; preds = %if.then68, %if.end65
  %68 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %69 = lshr i32 %68, 7
  %bf.clear71 = and i32 %69, 1
  %cmp72 = icmp ne i32 %bf.clear71, 1
  br i1 %cmp72, label %if.then73, label %if.end75

if.then73:                                        ; preds = %if.end70
  %call74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end75

if.end75:                                         ; preds = %if.then73, %if.end70
  %70 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %71 = and i32 %70, -2
  %72 = or i32 %71, 1
  store i32 %72, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %73 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %74 = and i32 %73, -3
  store i32 %74, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %75 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %76 = and i32 %75, -5
  %77 = or i32 %76, 4
  store i32 %77, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %78 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %79 = and i32 %78, -9
  %80 = or i32 %79, 8
  store i32 %80, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %81 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %82 = and i32 %81, -17
  store i32 %82, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %83 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %84 = and i32 %83, -33
  %85 = or i32 %84, 32
  store i32 %85, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %86 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %87 = and i32 %86, -65
  %88 = or i32 %87, 64
  store i32 %88, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %89 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %90 = and i32 %89, -129
  %91 = or i32 %90, 128
  store i32 %91, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %92 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %bf.clear76 = and i32 %92, 1
  %cmp77 = icmp ne i32 %bf.clear76, 1
  br i1 %cmp77, label %if.then78, label %if.end80

if.then78:                                        ; preds = %if.end75
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end80

if.end80:                                         ; preds = %if.then78, %if.end75
  %93 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %94 = lshr i32 %93, 1
  %bf.clear81 = and i32 %94, 1
  %cmp82 = icmp ne i32 %bf.clear81, 0
  br i1 %cmp82, label %if.then83, label %if.end85

if.then83:                                        ; preds = %if.end80
  %call84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end85

if.end85:                                         ; preds = %if.then83, %if.end80
  %95 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %96 = lshr i32 %95, 2
  %bf.clear86 = and i32 %96, 1
  %cmp87 = icmp ne i32 %bf.clear86, 1
  br i1 %cmp87, label %if.then88, label %if.end90

if.then88:                                        ; preds = %if.end85
  %call89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end90

if.end90:                                         ; preds = %if.then88, %if.end85
  %97 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %98 = lshr i32 %97, 3
  %bf.clear91 = and i32 %98, 1
  %cmp92 = icmp ne i32 %bf.clear91, 1
  br i1 %cmp92, label %if.then93, label %if.end95

if.then93:                                        ; preds = %if.end90
  %call94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end95

if.end95:                                         ; preds = %if.then93, %if.end90
  %99 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %100 = lshr i32 %99, 4
  %bf.clear96 = and i32 %100, 1
  %cmp97 = icmp ne i32 %bf.clear96, 0
  br i1 %cmp97, label %if.then98, label %if.end100

if.then98:                                        ; preds = %if.end95
  %call99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end100

if.end100:                                        ; preds = %if.then98, %if.end95
  %101 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %102 = lshr i32 %101, 5
  %bf.clear101 = and i32 %102, 1
  %cmp102 = icmp ne i32 %bf.clear101, 1
  br i1 %cmp102, label %if.then103, label %if.end105

if.then103:                                       ; preds = %if.end100
  %call104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end105

if.end105:                                        ; preds = %if.then103, %if.end100
  %103 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %104 = lshr i32 %103, 6
  %bf.clear106 = and i32 %104, 1
  %cmp107 = icmp ne i32 %bf.clear106, 1
  br i1 %cmp107, label %if.then108, label %if.end110

if.then108:                                       ; preds = %if.end105
  %call109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end110

if.end110:                                        ; preds = %if.then108, %if.end105
  %105 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %106 = lshr i32 %105, 7
  %bf.clear111 = and i32 %106, 1
  %cmp112 = icmp ne i32 %bf.clear111, 1
  br i1 %cmp112, label %if.then113, label %if.end115

if.then113:                                       ; preds = %if.end110
  %call114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end115

if.end115:                                        ; preds = %if.then113, %if.end110
  %107 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %108 = and i32 %107, -65
  store i32 %108, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %109 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %110 = lshr i32 %109, 5
  %bf.clear116 = and i32 %110, 1
  %cmp117 = icmp ne i32 %bf.clear116, 1
  br i1 %cmp117, label %if.then118, label %if.end120

if.then118:                                       ; preds = %if.end115
  %call119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %if.end120

if.end120:                                        ; preds = %if.then118, %if.end115
  %111 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %112 = lshr i32 %111, 6
  %bf.clear121 = and i32 %112, 1
  %cmp122 = icmp ne i32 %bf.clear121, 0
  br i1 %cmp122, label %if.then123, label %if.end125

if.then123:                                       ; preds = %if.end120
  %call124 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %if.end125

if.end125:                                        ; preds = %if.then123, %if.end120
  %113 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %114 = lshr i32 %113, 7
  %bf.clear126 = and i32 %114, 1
  %cmp127 = icmp ne i32 %bf.clear126, 1
  br i1 %cmp127, label %if.then128, label %if.end130

if.then128:                                       ; preds = %if.end125
  %call129 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %if.end130

if.end130:                                        ; preds = %if.then128, %if.end125
  %115 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), align 1
  store i8 %115, i8* %firstChar, align 1
  %116 = load i8* %firstChar, align 1
  %conv = zext i8 %116 to i32
  %cmp131 = icmp eq i32 %conv, 181
  br i1 %cmp131, label %if.then133, label %if.else

if.then133:                                       ; preds = %if.end130
  %call134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0))
  br label %if.end144

if.else:                                          ; preds = %if.end130
  %117 = load i8* %firstChar, align 1
  %conv135 = zext i8 %117 to i32
  %cmp136 = icmp eq i32 %conv135, 173
  br i1 %cmp136, label %if.then138, label %if.else140

if.then138:                                       ; preds = %if.else
  %call139 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0))
  br label %if.end143

if.else140:                                       ; preds = %if.else
  %118 = load i8* %firstChar, align 1
  %conv141 = zext i8 %118 to i32
  %call142 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str5, i32 0, i32 0), i32 %conv141)
  br label %if.end143

if.end143:                                        ; preds = %if.else140, %if.then138
  br label %if.end144

if.end144:                                        ; preds = %if.end143, %if.then133
  %119 = load %struct.bfs** @p, align 8
  %120 = bitcast %struct.bfs* %119 to i32*
  %121 = load i32* %120, align 4
  %122 = and i32 %121, -65
  %123 = or i32 %122, 64
  store i32 %123, i32* %120, align 4
  %124 = load %struct.bfs** @p, align 8
  %125 = bitcast %struct.bfs* %124 to i32*
  %126 = load i32* %125, align 4
  %127 = lshr i32 %126, 5
  %bf.clear145 = and i32 %127, 1
  %cmp146 = icmp ne i32 %bf.clear145, 1
  br i1 %cmp146, label %if.then148, label %if.end150

if.then148:                                       ; preds = %if.end144
  %call149 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0))
  br label %if.end150

if.end150:                                        ; preds = %if.then148, %if.end144
  %128 = load %struct.bfs** @p, align 8
  %129 = bitcast %struct.bfs* %128 to i32*
  %130 = load i32* %129, align 4
  %131 = lshr i32 %130, 6
  %bf.clear151 = and i32 %131, 1
  %cmp152 = icmp ne i32 %bf.clear151, 1
  br i1 %cmp152, label %if.then154, label %if.end156

if.then154:                                       ; preds = %if.end150
  %call155 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0))
  br label %if.end156

if.end156:                                        ; preds = %if.then154, %if.end150
  %132 = load %struct.bfs** @p, align 8
  %133 = bitcast %struct.bfs* %132 to i32*
  %134 = load i32* %133, align 4
  %135 = lshr i32 %134, 7
  %bf.clear157 = and i32 %135, 1
  %cmp158 = icmp ne i32 %bf.clear157, 1
  br i1 %cmp158, label %if.then160, label %if.end162

if.then160:                                       ; preds = %if.end156
  %call161 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0))
  br label %if.end162

if.end162:                                        ; preds = %if.then160, %if.end156
  %136 = load %struct.bfs** @p, align 8
  %137 = bitcast %struct.bfs* %136 to i32*
  %138 = load i32* %137, align 4
  %139 = and i32 %138, -33
  store i32 %139, i32* %137, align 4
  %140 = load %struct.bfs** @p, align 8
  %141 = bitcast %struct.bfs* %140 to i32*
  %142 = load i32* %141, align 4
  %143 = and i32 %142, -129
  store i32 %143, i32* %141, align 4
  %144 = load %struct.bfs** @p, align 8
  %145 = bitcast %struct.bfs* %144 to i32*
  %146 = load i32* %145, align 4
  %147 = and i32 %146, -65
  %148 = or i32 %147, 64
  store i32 %148, i32* %145, align 4
  %149 = load %struct.bfs** @p, align 8
  %150 = bitcast %struct.bfs* %149 to i32*
  %151 = load i32* %150, align 4
  %152 = lshr i32 %151, 5
  %bf.clear163 = and i32 %152, 1
  %cmp164 = icmp ne i32 %bf.clear163, 0
  br i1 %cmp164, label %if.then166, label %if.end168

if.then166:                                       ; preds = %if.end162
  %call167 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0))
  br label %if.end168

if.end168:                                        ; preds = %if.then166, %if.end162
  %153 = load %struct.bfs** @p, align 8
  %154 = bitcast %struct.bfs* %153 to i32*
  %155 = load i32* %154, align 4
  %156 = lshr i32 %155, 6
  %bf.clear169 = and i32 %156, 1
  %cmp170 = icmp ne i32 %bf.clear169, 1
  br i1 %cmp170, label %if.then172, label %if.end174

if.then172:                                       ; preds = %if.end168
  %call173 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0))
  br label %if.end174

if.end174:                                        ; preds = %if.then172, %if.end168
  %157 = load %struct.bfs** @p, align 8
  %158 = bitcast %struct.bfs* %157 to i32*
  %159 = load i32* %158, align 4
  %160 = lshr i32 %159, 7
  %bf.clear175 = and i32 %160, 1
  %cmp176 = icmp ne i32 %bf.clear175, 0
  br i1 %cmp176, label %if.then178, label %if.end180

if.then178:                                       ; preds = %if.end174
  %call179 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0))
  br label %if.end180

if.end180:                                        ; preds = %if.then178, %if.end174
  ret i32 0
}

declare i32 @printf(i8*, ...)

define i32 @testTwos() nounwind uwtable {
entry:
  %firstChar = alloca i8, align 1
  %0 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %1 = and i32 %0, -769
  store i32 %1, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %2 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %3 = and i32 %2, -3073
  store i32 %3, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %4 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %5 = and i32 %4, -12289
  store i32 %5, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %6 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %7 = and i32 %6, -49153
  store i32 %7, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %8 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %9 = lshr i32 %8, 8
  %bf.clear = and i32 %9, 3
  %cmp = icmp ne i32 %bf.clear, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %10 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %11 = lshr i32 %10, 10
  %bf.clear1 = and i32 %11, 3
  %cmp2 = icmp ne i32 %bf.clear1, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %12 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %13 = lshr i32 %12, 12
  %bf.clear6 = and i32 %13, 3
  %cmp7 = icmp ne i32 %bf.clear6, 0
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end5
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end5
  %14 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %15 = lshr i32 %14, 14
  %bf.clear11 = and i32 %15, 3
  %cmp12 = icmp ne i32 %bf.clear11, 0
  br i1 %cmp12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end10
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end10
  %16 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %17 = and i32 %16, -769
  %18 = or i32 %17, 256
  store i32 %18, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %19 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %20 = and i32 %19, -3073
  %21 = or i32 %20, 1024
  store i32 %21, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %22 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %23 = and i32 %22, -12289
  %24 = or i32 %23, 4096
  store i32 %24, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %25 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %26 = and i32 %25, -49153
  %27 = or i32 %26, 16384
  store i32 %27, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %28 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %29 = lshr i32 %28, 8
  %bf.clear16 = and i32 %29, 3
  %cmp17 = icmp ne i32 %bf.clear16, 1
  br i1 %cmp17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.end15
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0))
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.end15
  %30 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %31 = lshr i32 %30, 10
  %bf.clear21 = and i32 %31, 3
  %cmp22 = icmp ne i32 %bf.clear21, 1
  br i1 %cmp22, label %if.then23, label %if.end25

if.then23:                                        ; preds = %if.end20
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0))
  br label %if.end25

if.end25:                                         ; preds = %if.then23, %if.end20
  %32 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %33 = lshr i32 %32, 12
  %bf.clear26 = and i32 %33, 3
  %cmp27 = icmp ne i32 %bf.clear26, 1
  br i1 %cmp27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end25
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0))
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.end25
  %34 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %35 = lshr i32 %34, 14
  %bf.clear31 = and i32 %35, 3
  %cmp32 = icmp ne i32 %bf.clear31, 1
  br i1 %cmp32, label %if.then33, label %if.end35

if.then33:                                        ; preds = %if.end30
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0))
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %if.end30
  %36 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %37 = and i32 %36, -769
  %38 = or i32 %37, 512
  store i32 %38, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %39 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %40 = and i32 %39, -3073
  %41 = or i32 %40, 2048
  store i32 %41, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %42 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %43 = and i32 %42, -12289
  %44 = or i32 %43, 8192
  store i32 %44, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %45 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %46 = and i32 %45, -49153
  %47 = or i32 %46, 32768
  store i32 %47, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %48 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %49 = lshr i32 %48, 8
  %bf.clear36 = and i32 %49, 3
  %cmp37 = icmp ne i32 %bf.clear36, 2
  br i1 %cmp37, label %if.then38, label %if.end40

if.then38:                                        ; preds = %if.end35
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0))
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %if.end35
  %50 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %51 = lshr i32 %50, 10
  %bf.clear41 = and i32 %51, 3
  %cmp42 = icmp ne i32 %bf.clear41, 2
  br i1 %cmp42, label %if.then43, label %if.end45

if.then43:                                        ; preds = %if.end40
  %call44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0))
  br label %if.end45

if.end45:                                         ; preds = %if.then43, %if.end40
  %52 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %53 = lshr i32 %52, 12
  %bf.clear46 = and i32 %53, 3
  %cmp47 = icmp ne i32 %bf.clear46, 2
  br i1 %cmp47, label %if.then48, label %if.end50

if.then48:                                        ; preds = %if.end45
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0))
  br label %if.end50

if.end50:                                         ; preds = %if.then48, %if.end45
  %54 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %55 = lshr i32 %54, 14
  %bf.clear51 = and i32 %55, 3
  %cmp52 = icmp ne i32 %bf.clear51, 2
  br i1 %cmp52, label %if.then53, label %if.end55

if.then53:                                        ; preds = %if.end50
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0))
  br label %if.end55

if.end55:                                         ; preds = %if.then53, %if.end50
  %56 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %57 = and i32 %56, -769
  %58 = or i32 %57, 256
  store i32 %58, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %59 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %60 = and i32 %59, -3073
  store i32 %60, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %61 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %62 = and i32 %61, -12289
  %63 = or i32 %62, 8192
  store i32 %63, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %64 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %65 = and i32 %64, -49153
  %66 = or i32 %65, 49152
  store i32 %66, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %67 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %68 = lshr i32 %67, 8
  %bf.clear56 = and i32 %68, 3
  %cmp57 = icmp ne i32 %bf.clear56, 1
  br i1 %cmp57, label %if.then58, label %if.end60

if.then58:                                        ; preds = %if.end55
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str11, i32 0, i32 0))
  br label %if.end60

if.end60:                                         ; preds = %if.then58, %if.end55
  %69 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %70 = lshr i32 %69, 10
  %bf.clear61 = and i32 %70, 3
  %cmp62 = icmp ne i32 %bf.clear61, 0
  br i1 %cmp62, label %if.then63, label %if.end65

if.then63:                                        ; preds = %if.end60
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str11, i32 0, i32 0))
  br label %if.end65

if.end65:                                         ; preds = %if.then63, %if.end60
  %71 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %72 = lshr i32 %71, 12
  %bf.clear66 = and i32 %72, 3
  %cmp67 = icmp ne i32 %bf.clear66, 2
  br i1 %cmp67, label %if.then68, label %if.end70

if.then68:                                        ; preds = %if.end65
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str11, i32 0, i32 0))
  br label %if.end70

if.end70:                                         ; preds = %if.then68, %if.end65
  %73 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %74 = lshr i32 %73, 14
  %bf.clear71 = and i32 %74, 3
  %cmp72 = icmp ne i32 %bf.clear71, 3
  br i1 %cmp72, label %if.then73, label %if.end75

if.then73:                                        ; preds = %if.end70
  %call74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str11, i32 0, i32 0))
  br label %if.end75

if.end75:                                         ; preds = %if.then73, %if.end70
  %75 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %76 = and i32 %75, -769
  %77 = or i32 %76, 768
  store i32 %77, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %78 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %79 = and i32 %78, -3073
  %80 = or i32 %79, 2048
  store i32 %80, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %81 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %82 = and i32 %81, -12289
  store i32 %82, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %83 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %84 = and i32 %83, -49153
  %85 = or i32 %84, 16384
  store i32 %85, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %86 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %87 = lshr i32 %86, 8
  %bf.clear76 = and i32 %87, 3
  %cmp77 = icmp ne i32 %bf.clear76, 3
  br i1 %cmp77, label %if.then78, label %if.end80

if.then78:                                        ; preds = %if.end75
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str12, i32 0, i32 0))
  br label %if.end80

if.end80:                                         ; preds = %if.then78, %if.end75
  %88 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %89 = lshr i32 %88, 10
  %bf.clear81 = and i32 %89, 3
  %cmp82 = icmp ne i32 %bf.clear81, 2
  br i1 %cmp82, label %if.then83, label %if.end85

if.then83:                                        ; preds = %if.end80
  %call84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str12, i32 0, i32 0))
  br label %if.end85

if.end85:                                         ; preds = %if.then83, %if.end80
  %90 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %91 = lshr i32 %90, 12
  %bf.clear86 = and i32 %91, 3
  %cmp87 = icmp ne i32 %bf.clear86, 0
  br i1 %cmp87, label %if.then88, label %if.end90

if.then88:                                        ; preds = %if.end85
  %call89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str12, i32 0, i32 0))
  br label %if.end90

if.end90:                                         ; preds = %if.then88, %if.end85
  %92 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %93 = lshr i32 %92, 14
  %bf.clear91 = and i32 %93, 3
  %cmp92 = icmp ne i32 %bf.clear91, 1
  br i1 %cmp92, label %if.then93, label %if.end95

if.then93:                                        ; preds = %if.end90
  %call94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str12, i32 0, i32 0))
  br label %if.end95

if.end95:                                         ; preds = %if.then93, %if.end90
  %94 = load i8* getelementptr inbounds (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i64 1), align 1
  store i8 %94, i8* %firstChar, align 1
  %95 = load i8* %firstChar, align 1
  %conv = zext i8 %95 to i32
  %cmp96 = icmp eq i32 %conv, 135
  br i1 %cmp96, label %if.then105, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end95
  %96 = load i8* %firstChar, align 1
  %conv98 = zext i8 %96 to i32
  %cmp99 = icmp eq i32 %conv98, 75
  br i1 %cmp99, label %if.then105, label %lor.lhs.false101

lor.lhs.false101:                                 ; preds = %lor.lhs.false
  %97 = load i8* %firstChar, align 1
  %conv102 = zext i8 %97 to i32
  %cmp103 = icmp eq i32 %conv102, 225
  br i1 %cmp103, label %if.then105, label %if.else

if.then105:                                       ; preds = %lor.lhs.false101, %lor.lhs.false, %if.end95
  %call106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0))
  br label %if.end109

if.else:                                          ; preds = %lor.lhs.false101
  %98 = load i8* %firstChar, align 1
  %conv107 = zext i8 %98 to i32
  %call108 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str13, i32 0, i32 0), i32 %conv107)
  br label %if.end109

if.end109:                                        ; preds = %if.else, %if.then105
  %99 = load %struct.bfs** @p, align 8
  %100 = bitcast %struct.bfs* %99 to i32*
  %101 = load i32* %100, align 4
  %102 = and i32 %101, -12289
  %103 = or i32 %102, 12288
  store i32 %103, i32* %100, align 4
  %104 = load %struct.bfs** @p, align 8
  %105 = bitcast %struct.bfs* %104 to i32*
  %106 = load i32* %105, align 4
  %107 = lshr i32 %106, 10
  %bf.clear110 = and i32 %107, 3
  %cmp111 = icmp ne i32 %bf.clear110, 2
  br i1 %cmp111, label %if.then113, label %if.end115

if.then113:                                       ; preds = %if.end109
  %call114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str14, i32 0, i32 0))
  br label %if.end115

if.end115:                                        ; preds = %if.then113, %if.end109
  %108 = load %struct.bfs** @p, align 8
  %109 = bitcast %struct.bfs* %108 to i32*
  %110 = load i32* %109, align 4
  %111 = lshr i32 %110, 12
  %bf.clear116 = and i32 %111, 3
  %cmp117 = icmp ne i32 %bf.clear116, 3
  br i1 %cmp117, label %if.then119, label %if.end121

if.then119:                                       ; preds = %if.end115
  %call120 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str14, i32 0, i32 0))
  br label %if.end121

if.end121:                                        ; preds = %if.then119, %if.end115
  %112 = load %struct.bfs** @p, align 8
  %113 = bitcast %struct.bfs* %112 to i32*
  %114 = load i32* %113, align 4
  %115 = lshr i32 %114, 14
  %bf.clear122 = and i32 %115, 3
  %cmp123 = icmp ne i32 %bf.clear122, 1
  br i1 %cmp123, label %if.then125, label %if.end127

if.then125:                                       ; preds = %if.end121
  %call126 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str14, i32 0, i32 0))
  br label %if.end127

if.end127:                                        ; preds = %if.then125, %if.end121
  ret i32 0
}

define i32 @testEights() nounwind uwtable {
entry:
  %firstChar = alloca i8, align 1
  %0 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %1 = and i32 %0, 16777215
  %2 = or i32 %1, -1224736768
  store i32 %2, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %3 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %4 = lshr i32 %3, 24
  %bf.clear = and i32 %4, 255
  %cmp = icmp ne i32 %bf.clear, 183
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str15, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %6 = and i32 %5, 16777215
  %7 = or i32 %6, 1258291200
  store i32 %7, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %8 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %9 = lshr i32 %8, 24
  %bf.clear1 = and i32 %9, 255
  %cmp2 = icmp ne i32 %bf.clear1, 75
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str16, i32 0, i32 0))
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %10 = load i8* getelementptr inbounds (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i64 3), align 1
  store i8 %10, i8* %firstChar, align 1
  %11 = load i8* %firstChar, align 1
  %conv = zext i8 %11 to i32
  %cmp6 = icmp eq i32 %conv, 75
  br i1 %cmp6, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end5
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0))
  br label %if.end12

if.else:                                          ; preds = %if.end5
  %12 = load i8* %firstChar, align 1
  %conv10 = zext i8 %12 to i32
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str17, i32 0, i32 0), i32 %conv10)
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then8
  %13 = load %struct.bfs** @p, align 8
  %14 = bitcast %struct.bfs* %13 to i32*
  %15 = load i32* %14, align 4
  %16 = and i32 %15, 16777215
  %17 = or i32 %16, 1879048192
  store i32 %17, i32* %14, align 4
  %18 = load %struct.bfs** @p, align 8
  %19 = bitcast %struct.bfs* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = lshr i32 %20, 24
  %bf.clear13 = and i32 %21, 255
  %cmp14 = icmp ne i32 %bf.clear13, 112
  br i1 %cmp14, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.end12
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str18, i32 0, i32 0))
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.end12
  ret i32 0
}

define i32 @testSixteens() nounwind uwtable {
entry:
  %firstChar = alloca i16, align 2
  %0 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %1 = and i32 %0, -65536
  %2 = or i32 %1, 30203
  store i32 %2, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %3 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %bf.clear = and i32 %3, 65535
  %cmp = icmp ne i32 %bf.clear, 30203
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str19, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %5 = and i32 %4, -65536
  %6 = or i32 %5, 23213
  store i32 %6, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %7 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %bf.clear1 = and i32 %7, 65535
  %cmp2 = icmp ne i32 %bf.clear1, 23213
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str20, i32 0, i32 0))
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %8 = load i16* bitcast (i8* getelementptr inbounds (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i64 4) to i16*), align 2
  store i16 %8, i16* %firstChar, align 2
  %9 = load i16* %firstChar, align 2
  %conv = zext i16 %9 to i32
  %cmp6 = icmp eq i32 %conv, 23213
  br i1 %cmp6, label %if.then11, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end5
  %10 = load i16* %firstChar, align 2
  %conv8 = zext i16 %10 to i32
  %cmp9 = icmp eq i32 %conv8, 44378
  br i1 %cmp9, label %if.then11, label %if.else

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str21, i32 0, i32 0))
  br label %if.end15

if.else:                                          ; preds = %lor.lhs.false
  %11 = load i16* %firstChar, align 2
  %conv13 = zext i16 %11 to i32
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 %conv13)
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then11
  %12 = load %struct.bfs** @p, align 8
  %13 = bitcast %struct.bfs* %12 to i8*
  %bf.field.offs = getelementptr i8* %13, i32 4
  %14 = bitcast i8* %bf.field.offs to i32*
  %15 = load i32* %14, align 4
  %16 = and i32 %15, -65536
  %17 = or i32 %16, 11606
  store i32 %17, i32* %14, align 4
  %18 = load %struct.bfs** @p, align 8
  %19 = bitcast %struct.bfs* %18 to i8*
  %bf.field.offs16 = getelementptr i8* %19, i32 4
  %20 = bitcast i8* %bf.field.offs16 to i32*
  %21 = load i32* %20, align 4
  %bf.clear17 = and i32 %21, 65535
  %cmp18 = icmp ne i32 %bf.clear17, 11606
  br i1 %cmp18, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.end15
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str23, i32 0, i32 0))
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.end15
  ret i32 0
}

define i32 @testPartial() nounwind uwtable {
entry:
  %firstChar = alloca i8, align 1
  %0 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %1 = and i32 %0, -4128769
  %2 = or i32 %1, 2949120
  store i32 %2, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  store i8 -111, i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 11), align 1
  %3 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %4 = lshr i32 %3, 16
  %bf.clear = and i32 %4, 63
  %cmp = icmp ne i32 %bf.clear, 45
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str24, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 11), align 1
  %conv = zext i8 %5 to i32
  %cmp1 = icmp ne i32 %conv, 145
  br i1 %cmp1, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str24, i32 0, i32 0))
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  store i8 75, i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 11), align 1
  %6 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %7 = lshr i32 %6, 16
  %bf.clear6 = and i32 %7, 63
  %cmp7 = icmp ne i32 %bf.clear6, 45
  br i1 %cmp7, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end5
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str25, i32 0, i32 0))
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end5
  %8 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 11), align 1
  %conv12 = zext i8 %8 to i32
  %cmp13 = icmp ne i32 %conv12, 75
  br i1 %cmp13, label %if.then15, label %if.end17

if.then15:                                        ; preds = %if.end11
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str25, i32 0, i32 0))
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %if.end11
  %9 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %10 = and i32 %9, -4128769
  %11 = or i32 %10, 1376256
  store i32 %11, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %12 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %13 = lshr i32 %12, 16
  %bf.clear18 = and i32 %13, 63
  %cmp19 = icmp ne i32 %bf.clear18, 21
  br i1 %cmp19, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end17
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str26, i32 0, i32 0))
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end17
  %14 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 11), align 1
  %conv24 = zext i8 %14 to i32
  %cmp25 = icmp ne i32 %conv24, 75
  br i1 %cmp25, label %if.then27, label %if.end29

if.then27:                                        ; preds = %if.end23
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str26, i32 0, i32 0))
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %if.end23
  %15 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 11), align 1
  store i8 %15, i8* %firstChar, align 1
  %16 = load i8* %firstChar, align 1
  %conv30 = zext i8 %16 to i32
  %cmp31 = icmp eq i32 %conv30, 75
  br i1 %cmp31, label %if.then33, label %if.else

if.then33:                                        ; preds = %if.end29
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str27, i32 0, i32 0))
  br label %if.end37

if.else:                                          ; preds = %if.end29
  %17 = load i8* %firstChar, align 1
  %conv35 = zext i8 %17 to i32
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str28, i32 0, i32 0), i32 %conv35)
  br label %if.end37

if.end37:                                         ; preds = %if.else, %if.then33
  %18 = load %struct.bfs** @p, align 8
  %g = getelementptr inbounds %struct.bfs* %18, i32 0, i32 11
  store i8 119, i8* %g, align 1
  %19 = load %struct.bfs** @p, align 8
  %g38 = getelementptr inbounds %struct.bfs* %19, i32 0, i32 11
  %20 = load i8* %g38, align 1
  %conv39 = zext i8 %20 to i32
  %cmp40 = icmp ne i32 %conv39, 119
  br i1 %cmp40, label %if.then42, label %if.end44

if.then42:                                        ; preds = %if.end37
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str29, i32 0, i32 0))
  br label %if.end44

if.end44:                                         ; preds = %if.then42, %if.end37
  ret i32 0
}

define i32 @testBigPartial() nounwind uwtable {
entry:
  %0 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %1 = and i32 %0, -8192
  %2 = or i32 %1, 45
  store i32 %2, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %3 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %4 = and i32 %3, -57345
  %5 = or i32 %4, 16384
  store i32 %5, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %6 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %bf.clear = and i32 %6, 8191
  %cmp = icmp ne i32 %bf.clear, 45
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %bf.clear1 = and i32 %7, 8191
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str30, i32 0, i32 0), i32 %bf.clear1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %8 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %9 = lshr i32 %8, 13
  %bf.clear2 = and i32 %9, 7
  %cmp3 = icmp ne i32 %bf.clear2, 2
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.end
  %10 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %11 = lshr i32 %10, 13
  %bf.clear5 = and i32 %11, 7
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str31, i32 0, i32 0), i32 %bf.clear5)
  br label %if.end7

if.end7:                                          ; preds = %if.then4, %if.end
  %12 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %13 = and i32 %12, -57345
  %14 = or i32 %13, 57344
  store i32 %14, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %15 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %bf.clear8 = and i32 %15, 8191
  %cmp9 = icmp ne i32 %bf.clear8, 45
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %if.end7
  %16 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %bf.clear11 = and i32 %16, 8191
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str32, i32 0, i32 0), i32 %bf.clear11)
  br label %if.end13

if.end13:                                         ; preds = %if.then10, %if.end7
  %17 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %18 = lshr i32 %17, 13
  %bf.clear14 = and i32 %18, 7
  %cmp15 = icmp ne i32 %bf.clear14, 7
  br i1 %cmp15, label %if.then16, label %if.end19

if.then16:                                        ; preds = %if.end13
  %19 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %20 = lshr i32 %19, 13
  %bf.clear17 = and i32 %20, 7
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i32 %bf.clear17)
  br label %if.end19

if.end19:                                         ; preds = %if.then16, %if.end13
  %21 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %22 = and i32 %21, -8192
  %23 = or i32 %22, 3073
  store i32 %23, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %24 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %bf.clear20 = and i32 %24, 8191
  %cmp21 = icmp ne i32 %bf.clear20, 3073
  br i1 %cmp21, label %if.then22, label %if.end25

if.then22:                                        ; preds = %if.end19
  %25 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %bf.clear23 = and i32 %25, 8191
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str34, i32 0, i32 0), i32 %bf.clear23)
  br label %if.end25

if.end25:                                         ; preds = %if.then22, %if.end19
  %26 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %27 = lshr i32 %26, 13
  %bf.clear26 = and i32 %27, 7
  %cmp27 = icmp ne i32 %bf.clear26, 7
  br i1 %cmp27, label %if.then28, label %if.end31

if.then28:                                        ; preds = %if.end25
  %28 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %29 = lshr i32 %28, 13
  %bf.clear29 = and i32 %29, 7
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str35, i32 0, i32 0), i32 %bf.clear29)
  br label %if.end31

if.end31:                                         ; preds = %if.then28, %if.end25
  %30 = load %struct.bfs** @p, align 8
  %31 = bitcast %struct.bfs* %30 to i8*
  %bf.field.offs = getelementptr i8* %31, i32 8
  %32 = bitcast i8* %bf.field.offs to i32*
  %33 = load i32* %32, align 4
  %34 = and i32 %33, -8192
  %35 = or i32 %34, 2000
  store i32 %35, i32* %32, align 4
  %36 = load %struct.bfs** @p, align 8
  %37 = bitcast %struct.bfs* %36 to i8*
  %bf.field.offs32 = getelementptr i8* %37, i32 8
  %38 = bitcast i8* %bf.field.offs32 to i32*
  %39 = load i32* %38, align 4
  %bf.clear33 = and i32 %39, 8191
  %cmp34 = icmp ne i32 %bf.clear33, 2000
  br i1 %cmp34, label %if.then35, label %if.end40

if.then35:                                        ; preds = %if.end31
  %40 = load %struct.bfs** @p, align 8
  %41 = bitcast %struct.bfs* %40 to i8*
  %bf.field.offs36 = getelementptr i8* %41, i32 8
  %42 = bitcast i8* %bf.field.offs36 to i32*
  %43 = load i32* %42, align 4
  %bf.clear37 = and i32 %43, 8191
  %44 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 8) to i32*), align 4
  %bf.clear38 = and i32 %44, 8191
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str36, i32 0, i32 0), i32 %bf.clear37, i32 %bf.clear38)
  br label %if.end40

if.end40:                                         ; preds = %if.then35, %if.end31
  ret i32 0
}

define i32 @testJustBigPartial() nounwind uwtable {
entry:
  %0 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %1 = and i32 %0, -2048
  %2 = or i32 %1, 45
  store i32 %2, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %3 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %bf.clear = and i32 %3, 2047
  %cmp = icmp ne i32 %bf.clear, 45
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %bf.clear1 = and i32 %4, 2047
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str37, i32 0, i32 0), i32 %bf.clear1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %6 = and i32 %5, -2048
  %7 = or i32 %6, 7
  store i32 %7, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %8 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %bf.clear2 = and i32 %8, 2047
  %cmp3 = icmp ne i32 %bf.clear2, 7
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.end
  %9 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %bf.clear5 = and i32 %9, 2047
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str38, i32 0, i32 0), i32 %bf.clear5)
  br label %if.end7

if.end7:                                          ; preds = %if.then4, %if.end
  %10 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %11 = and i32 %10, -2048
  %12 = or i32 %11, 1137
  store i32 %12, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %13 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %bf.clear8 = and i32 %13, 2047
  %cmp9 = icmp ne i32 %bf.clear8, 1137
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %if.end7
  %14 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %bf.clear11 = and i32 %14, 2047
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str39, i32 0, i32 0), i32 %bf.clear11)
  br label %if.end13

if.end13:                                         ; preds = %if.then10, %if.end7
  %15 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %16 = and i32 %15, -2048
  %17 = or i32 %16, 601
  store i32 %17, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %18 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %bf.clear14 = and i32 %18, 2047
  %cmp15 = icmp ne i32 %bf.clear14, 601
  br i1 %cmp15, label %if.then16, label %if.end19

if.then16:                                        ; preds = %if.end13
  %19 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %bf.clear17 = and i32 %19, 2047
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str40, i32 0, i32 0), i32 %bf.clear17)
  br label %if.end19

if.end19:                                         ; preds = %if.then16, %if.end13
  %20 = load %struct.bfs** @p, align 8
  %21 = bitcast %struct.bfs* %20 to i8*
  %bf.field.offs = getelementptr i8* %21, i32 12
  %22 = bitcast i8* %bf.field.offs to i32*
  %23 = load i32* %22, align 4
  %24 = and i32 %23, -2048
  %25 = or i32 %24, 1025
  store i32 %25, i32* %22, align 4
  %26 = load %struct.bfs** @p, align 8
  %27 = bitcast %struct.bfs* %26 to i8*
  %bf.field.offs20 = getelementptr i8* %27, i32 12
  %28 = bitcast i8* %bf.field.offs20 to i32*
  %29 = load i32* %28, align 4
  %bf.clear21 = and i32 %29, 2047
  %cmp22 = icmp ne i32 %bf.clear21, 1025
  br i1 %cmp22, label %if.then23, label %if.end28

if.then23:                                        ; preds = %if.end19
  %30 = load %struct.bfs** @p, align 8
  %31 = bitcast %struct.bfs* %30 to i8*
  %bf.field.offs24 = getelementptr i8* %31, i32 12
  %32 = bitcast i8* %bf.field.offs24 to i32*
  %33 = load i32* %32, align 4
  %bf.clear25 = and i32 %33, 2047
  %34 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0), i32 12) to i32*), align 4
  %bf.clear26 = and i32 %34, 2047
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str41, i32 0, i32 0), i32 %bf.clear25, i32 %bf.clear26)
  br label %if.end28

if.end28:                                         ; preds = %if.then23, %if.end19
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @testOnes()
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str42, i32 0, i32 0))
  %call2 = call i32 @testTwos()
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str43, i32 0, i32 0))
  %call4 = call i32 @testEights()
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str44, i32 0, i32 0))
  %call6 = call i32 @testSixteens()
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str45, i32 0, i32 0))
  %call8 = call i32 @testPartial()
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str46, i32 0, i32 0))
  %call10 = call i32 @testJustBigPartial()
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str47, i32 0, i32 0))
  %call12 = call i32 @testBigPartial()
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str48, i32 0, i32 0))
  ret i32 0
}
