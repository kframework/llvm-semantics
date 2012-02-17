; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000423.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_11 = global i32 -1824385567, align 4
@g_27 = global [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -1, i32 -1]], align 16
@g_26 = global [1 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([1 x [4 x i32]]* @g_27 to i8*), i64 8) to i32*)], align 8
@g_29 = global i32 -1414046302, align 4
@g_28 = global [6 x [8 x [1 x i32*]]] [[8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]]], align 16
@g_30 = global i32* null, align 8
@g_35 = global i32* @g_29, align 8
@g_34 = global i32** @g_35, align 8
@g_57 = global i32* null, align 8
@g_56 = global i32** @g_57, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"checksum g_29 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_10 = alloca i64, align 8
  %l_62 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_65 = alloca i32, align 4
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %l_70 = alloca i8, align 1
  store i64 -1736893734999795570, i64* %l_10, align 8
  store i32 4, i32* %l_62, align 4
  %2 = load i64* %l_10, align 8
  %3 = trunc i64 %2 to i16
  %4 = load i32* @g_11, align 4
  %5 = trunc i32 %4 to i16
  %6 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %3, i16 signext %5)
  %7 = sext i16 %6 to i64
  %8 = icmp ne i64 %7, 2401304733
  %9 = zext i1 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = load i32* @g_11, align 4
  %12 = zext i32 %11 to i64
  %13 = call i64 @safe_sub_func_uint64_t_u_u(i64 %10, i64 %12)
  %14 = load i32* @g_11, align 4
  %15 = zext i32 %14 to i64
  %16 = icmp ne i64 %13, %15
  %17 = zext i1 %16 to i32
  %18 = trunc i32 %17 to i16
  %19 = load i32* @g_11, align 4
  %20 = zext i32 %19 to i64
  %21 = load i64* %l_10, align 8
  %22 = call i64 @safe_div_func_uint64_t_u_u(i64 %20, i64 %21)
  %23 = load i64* %l_10, align 8
  %24 = load i64* %l_10, align 8
  %25 = icmp ule i64 %23, %24
  %26 = zext i1 %25 to i32
  %27 = sext i32 %26 to i64
  %28 = icmp ule i64 %22, %27
  %29 = zext i1 %28 to i32
  %30 = load i64* %l_10, align 8
  %31 = trunc i64 %30 to i8
  %32 = load i32** @g_35, align 8
  %33 = load i32* %32
  %34 = load i32* @g_29, align 4
  %35 = sext i32 %34 to i64
  %36 = load i64* %l_10, align 8
  %37 = trunc i64 %36 to i16
  %38 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext 4, i16 zeroext %37)
  %39 = zext i16 %38 to i32
  %40 = load i32* @g_11, align 4
  %41 = call i32 @func_14(i8 signext %31, i32 %33, i64 %35, i32 %39, i32 %40)
  %42 = icmp sle i32 %29, %41
  %43 = zext i1 %42 to i32
  %44 = load i64* %l_10, align 8
  %45 = icmp ne i64 %44, 0
  br i1 %45, label %54, label %46

; <label>:46                                      ; preds = %0
  %47 = load i64* %l_10, align 8
  %48 = trunc i64 %47 to i8
  %49 = load i64* %l_10, align 8
  %50 = trunc i64 %49 to i8
  %51 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %48, i8 zeroext %50)
  %52 = zext i8 %51 to i32
  %53 = icmp ne i32 %52, 4
  br label %54

; <label>:54                                      ; preds = %46, %0
  %55 = phi i1 [ true, %0 ], [ %53, %46 ]
  %56 = zext i1 %55 to i32
  %57 = icmp slt i32 %43, %56
  %58 = zext i1 %57 to i32
  %59 = trunc i32 %58 to i16
  %60 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %18, i16 zeroext %59)
  %61 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %60, i32 -1723480469)
  %62 = icmp ne i16 %61, 0
  br i1 %62, label %63, label %134

; <label>:63                                      ; preds = %54
  store i32 -474292424, i32* %l_65, align 4
  %64 = load volatile i32*** @g_34, align 8
  %65 = load i32** %64
  %66 = load i32* %65
  %67 = sext i32 %66 to i64
  %68 = and i64 4059292008, %67
  %69 = load i32* @g_29, align 4
  %70 = trunc i32 %69 to i8
  %71 = load i32* %l_65, align 4
  %72 = call i32* @func_20(i64 %68, i8 signext %70, i32 %71)
  %73 = load i32*** @g_56, align 8
  store i32* %72, i32** %73
  store i32 0, i32* %l_65, align 4
  br label %74

; <label>:74                                      ; preds = %92, %63
  %75 = load i32* %l_65, align 4
  %76 = icmp slt i32 %75, 1
  br i1 %76, label %77, label %95

; <label>:77                                      ; preds = %74
  store i32 0, i32* @g_29, align 4
  br label %78

; <label>:78                                      ; preds = %88, %77
  %79 = load i32* @g_29, align 4
  %80 = icmp slt i32 %79, 4
  br i1 %80, label %81, label %91

; <label>:81                                      ; preds = %78
  %82 = load i32* @g_29, align 4
  %83 = sext i32 %82 to i64
  %84 = load i32* %l_65, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [1 x [4 x i32]]* @g_27, i32 0, i64 %85
  %87 = getelementptr inbounds [4 x i32]* %86, i32 0, i64 %83
  store volatile i32 -1, i32* %87, align 4
  br label %88

; <label>:88                                      ; preds = %81
  %89 = load i32* @g_29, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* @g_29, align 4
  br label %78

; <label>:91                                      ; preds = %78
  br label %92

; <label>:92                                      ; preds = %91
  %93 = load i32* %l_65, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %l_65, align 4
  br label %74

; <label>:95                                      ; preds = %74
  store i32 12, i32* @g_11, align 4
  br label %96

; <label>:96                                      ; preds = %101, %95
  %97 = load i32* @g_11, align 4
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %106

; <label>:99                                      ; preds = %96
  %100 = load i32* %l_65, align 4
  store i32 %100, i32* %1
  br label %190
                                                  ; No predecessors!
  %102 = load i32* @g_11, align 4
  %103 = trunc i32 %102 to i8
  %104 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %103, i8 signext 1)
  %105 = sext i8 %104 to i32
  store i32 %105, i32* @g_11, align 4
  br label %96

; <label>:106                                     ; preds = %96
  store i32 0, i32* @g_29, align 4
  br label %107

; <label>:107                                     ; preds = %128, %106
  %108 = load i32* @g_29, align 4
  %109 = icmp sle i32 %108, 0
  br i1 %109, label %110, label %133

; <label>:110                                     ; preds = %107
  store i32 0, i32* @g_11, align 4
  br label %111

; <label>:111                                     ; preds = %124, %110
  %112 = load i32* @g_11, align 4
  %113 = icmp ult i32 %112, 1
  br i1 %113, label %114, label %127

; <label>:114                                     ; preds = %111
  store i32 1, i32* %l_65, align 4
  br label %115

; <label>:115                                     ; preds = %120, %114
  %116 = load i32* %l_65, align 4
  %117 = icmp slt i32 %116, 4
  br i1 %117, label %118, label %123

; <label>:118                                     ; preds = %115
  %119 = load i32* @g_29, align 4
  store i32 %119, i32* %1
  br label %190
                                                  ; No predecessors!
  %121 = load i32* %l_65, align 4
  %122 = add nsw i32 %121, 3
  store i32 %122, i32* %l_65, align 4
  br label %115

; <label>:123                                     ; preds = %115
  br label %124

; <label>:124                                     ; preds = %123
  %125 = load i32* @g_11, align 4
  %126 = add i32 %125, 1
  store i32 %126, i32* @g_11, align 4
  br label %111

; <label>:127                                     ; preds = %111
  br label %128

; <label>:128                                     ; preds = %127
  %129 = load i32* @g_29, align 4
  %130 = sext i32 %129 to i64
  %131 = call i64 @safe_add_func_int64_t_s_s(i64 %130, i64 1)
  %132 = trunc i64 %131 to i32
  store i32 %132, i32* @g_29, align 4
  br label %107

; <label>:133                                     ; preds = %107
  br label %139

; <label>:134                                     ; preds = %54
  store i8 -1, i8* %l_70, align 1
  %135 = load i8* %l_70, align 1
  %136 = zext i8 %135 to i32
  %137 = call i32* @func_32(i32 %136)
  %138 = load i32*** @g_56, align 8
  store i32* %137, i32** %138
  br label %139

; <label>:139                                     ; preds = %134, %133
  store i32 0, i32* @g_11, align 4
  br label %140

; <label>:140                                     ; preds = %153, %139
  %141 = load i32* @g_11, align 4
  %142 = icmp ult i32 %141, 1
  br i1 %142, label %143, label %156

; <label>:143                                     ; preds = %140
  store i32 3, i32* @g_29, align 4
  br label %144

; <label>:144                                     ; preds = %149, %143
  %145 = load i32* @g_29, align 4
  %146 = icmp sge i32 %145, 0
  br i1 %146, label %147, label %152

; <label>:147                                     ; preds = %144
  %148 = load volatile i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 3), align 4
  store i32 %148, i32* %1
  br label %190
                                                  ; No predecessors!
  %150 = load i32* @g_29, align 4
  %151 = add nsw i32 %150, -4
  store i32 %151, i32* @g_29, align 4
  br label %144

; <label>:152                                     ; preds = %144
  br label %153

; <label>:153                                     ; preds = %152
  %154 = load i32* @g_11, align 4
  %155 = add i32 %154, 1
  store i32 %155, i32* @g_11, align 4
  br label %140

; <label>:156                                     ; preds = %140
  store i64 0, i64* %l_10, align 8
  br label %157

; <label>:157                                     ; preds = %185, %156
  %158 = load i64* %l_10, align 8
  %159 = icmp ult i64 %158, 6
  br i1 %159, label %160, label %188

; <label>:160                                     ; preds = %157
  store i32 0, i32* @g_11, align 4
  br label %161

; <label>:161                                     ; preds = %181, %160
  %162 = load i32* @g_11, align 4
  %163 = icmp ult i32 %162, 8
  br i1 %163, label %164, label %184

; <label>:164                                     ; preds = %161
  store i32 0, i32* @g_29, align 4
  br label %165

; <label>:165                                     ; preds = %177, %164
  %166 = load i32* @g_29, align 4
  %167 = icmp slt i32 %166, 1
  br i1 %167, label %168, label %180

; <label>:168                                     ; preds = %165
  %169 = load i32* @g_29, align 4
  %170 = sext i32 %169 to i64
  %171 = load i32* @g_11, align 4
  %172 = zext i32 %171 to i64
  %173 = load i64* %l_10, align 8
  %174 = getelementptr inbounds [6 x [8 x [1 x i32*]]]* @g_28, i32 0, i64 %173
  %175 = getelementptr inbounds [8 x [1 x i32*]]* %174, i32 0, i64 %172
  %176 = getelementptr inbounds [1 x i32*]* %175, i32 0, i64 %170
  store volatile i32* null, i32** %176, align 8
  br label %177

; <label>:177                                     ; preds = %168
  %178 = load i32* @g_29, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, i32* @g_29, align 4
  br label %165

; <label>:180                                     ; preds = %165
  br label %181

; <label>:181                                     ; preds = %180
  %182 = load i32* @g_11, align 4
  %183 = add i32 %182, 1
  store i32 %183, i32* @g_11, align 4
  br label %161

; <label>:184                                     ; preds = %161
  br label %185

; <label>:185                                     ; preds = %184
  %186 = load i64* %l_10, align 8
  %187 = add i64 %186, 1
  store i64 %187, i64* %l_10, align 8
  br label %157

; <label>:188                                     ; preds = %157
  %189 = load volatile i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  store i32 %189, i32* %1
  br label %190

; <label>:190                                     ; preds = %188, %147, %118, %99
  %191 = load i32* %1
  ret i32 %191
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i16* %1, align 2
  %7 = zext i16 %6 to i32
  %8 = load i32* %2, align 4
  %9 = ashr i32 65535, %8
  %10 = icmp sgt i32 %7, %9
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %5, %0
  %12 = load i16* %1, align 2
  %13 = zext i16 %12 to i32
  br label %19

; <label>:14                                      ; preds = %5
  %15 = load i16* %1, align 2
  %16 = zext i16 %15 to i32
  %17 = load i32* %2, align 4
  %18 = shl i32 %16, %17
  br label %19

; <label>:19                                      ; preds = %14, %11
  %20 = phi i32 [ %13, %11 ], [ %18, %14 ]
  %21 = trunc i32 %20 to i16
  ret i16 %21
}

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = sub i64 %3, %4
  ret i64 %5
}

define internal signext i16 @safe_mod_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp eq i32 %8, -32768
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i16* %2, align 2
  %12 = sext i16 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i16* %1, align 2
  %16 = sext i16 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i16* %1, align 2
  %19 = sext i16 %18 to i32
  %20 = load i16* %2, align 2
  %21 = sext i16 %20 to i32
  %22 = srem i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define internal i64 @safe_div_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i64* %1, align 8
  %9 = load i64* %2, align 8
  %10 = udiv i64 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i64 [ %6, %5 ], [ %10, %7 ]
  ret i64 %12
}

define i32 @func_14(i8 signext %p_15, i32 %p_16, i64 %p_17, i32 %p_18, i32 %p_19) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %l_36 = alloca i32, align 4
  %l_37 = alloca i32**, align 8
  %l_58 = alloca i32*, align 8
  %l_59 = alloca i8, align 1
  store i8 %p_15, i8* %1, align 1
  store i32 %p_16, i32* %2, align 4
  store i64 %p_17, i64* %3, align 8
  store i32 %p_18, i32* %4, align 4
  store i32 %p_19, i32* %5, align 4
  store i32 2, i32* %l_36, align 4
  store i32** @g_35, i32*** %l_37, align 8
  store i32* null, i32** %l_58, align 8
  store i8 -4, i8* %l_59, align 1
  %6 = load i32* %5, align 4
  %7 = zext i32 %6 to i64
  %8 = load volatile i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  %9 = trunc i32 %8 to i8
  %10 = load i32* %l_36, align 4
  %11 = call i32* @func_20(i64 %7, i8 signext %9, i32 %10)
  %12 = load i32*** %l_37, align 8
  store i32* %11, i32** %12
  %13 = load i32* @g_11, align 4
  %14 = load i32*** %l_37, align 8
  %15 = load i32** %14
  %16 = call i32 @func_42(i32 %13, i32* %15)
  %17 = icmp ne i32 %16, 0
  %18 = xor i1 %17, true
  %19 = zext i1 %18 to i32
  %20 = sext i32 %19 to i64
  %21 = load i32* %4, align 4
  %22 = load i8* %l_59, align 1
  %23 = sext i8 %22 to i32
  %24 = or i32 %21, %23
  %25 = zext i32 %24 to i64
  %26 = load i32*** %l_37, align 8
  %27 = load i32** %26
  %28 = load i32* %27
  %29 = sext i32 %28 to i64
  %30 = call i64 @safe_div_func_uint64_t_u_u(i64 %25, i64 %29)
  %31 = call i64 @safe_add_func_int64_t_s_s(i64 %20, i64 %30)
  %32 = trunc i64 %31 to i16
  %33 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %32, i16 signext 0)
  %34 = sext i16 %33 to i32
  %35 = load i32** @g_35, align 8
  store i32 %34, i32* %35
  %36 = load i8* %1, align 1
  %37 = sext i8 %36 to i32
  ret i32 %37
}

define internal zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i16* %1, align 2
  %11 = zext i16 %10 to i32
  %12 = load i16* %2, align 2
  %13 = zext i16 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i16
  ret i16 %17
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32* @func_20(i64 %p_21, i8 signext %p_22, i32 %p_23) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %l_31 = alloca i32*, align 8
  store i64 %p_21, i64* %1, align 8
  store i8 %p_22, i8* %2, align 1
  store i32 %p_23, i32* %3, align 4
  store i32* @g_29, i32** %l_31, align 8
  %4 = load i32** getelementptr inbounds ([1 x i32*]* @g_26, i32 0, i64 0), align 8
  %5 = icmp ne i32* %4, getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2)
  %6 = zext i1 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = xor i64 %7, -1
  %9 = trunc i64 %8 to i8
  %10 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %9, i32 1)
  %11 = sext i8 %10 to i32
  %12 = load i32** %l_31, align 8
  store i32 %11, i32* %12
  %13 = load volatile i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  %14 = call i32* @func_32(i32 %13)
  %15 = load volatile i32*** @g_34, align 8
  store i32* %14, i32** %15
  %16 = load volatile i32*** @g_34, align 8
  %17 = load i32** %16
  ret i32* %17
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = icmp sgt i64 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i64* %2, align 8
  %7 = icmp sgt i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i64* %1, align 8
  %10 = load i64* %2, align 8
  %11 = sub nsw i64 9223372036854775807, %10
  %12 = icmp sgt i64 %9, %11
  br i1 %12, label %24, label %13

; <label>:13                                      ; preds = %8, %5, %0
  %14 = load i64* %1, align 8
  %15 = icmp slt i64 %14, 0
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %13
  %17 = load i64* %2, align 8
  %18 = icmp slt i64 %17, 0
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i64* %1, align 8
  %21 = load i64* %2, align 8
  %22 = sub nsw i64 -9223372036854775808, %21
  %23 = icmp slt i64 %20, %22
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19, %8
  %25 = load i64* %1, align 8
  br label %30

; <label>:26                                      ; preds = %19, %16, %13
  %27 = load i64* %1, align 8
  %28 = load i64* %2, align 8
  %29 = add nsw i64 %27, %28
  br label %30

; <label>:30                                      ; preds = %26, %24
  %31 = phi i64 [ %25, %24 ], [ %29, %26 ]
  ret i64 %31
}

define i32* @func_32(i32 %p_33) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %p_33, i32* %1, align 4
  ret i32* @g_29
}

define internal signext i16 @safe_mul_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = mul nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32 @func_42(i32 %p_43, i32* %p_44) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  store i32 %p_43, i32* %1, align 4
  store i32* %p_44, i32** %2, align 8
  %3 = load i32** %2, align 8
  %4 = load i32* %3
  ret i32 %4
}

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9, %6, %0
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  br label %20

; <label>:15                                      ; preds = %9
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  %18 = load i32* %2, align 4
  %19 = ashr i32 %17, %18
  br label %20

; <label>:20                                      ; preds = %15, %12
  %21 = phi i32 [ %14, %12 ], [ %19, %15 ]
  %22 = trunc i32 %21 to i8
  ret i8 %22
}

define i32* @func_47(i32** %p_48, i32 %p_49, i32** %p_50, i32 %p_51) nounwind uwtable {
  %1 = alloca i32**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32**, align 8
  %4 = alloca i32, align 4
  %l_54 = alloca [1 x i32], align 4
  %l_55 = alloca i8, align 1
  %i = alloca i32, align 4
  store i32** %p_48, i32*** %1, align 8
  store i32 %p_49, i32* %2, align 4
  store i32** %p_50, i32*** %3, align 8
  store i32 %p_51, i32* %4, align 4
  store i8 1, i8* %l_55, align 1
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %12, %0
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [1 x i32]* %l_54, i32 0, i64 %10
  store i32 -1024458125, i32* %11, align 4
  br label %12

; <label>:12                                      ; preds = %8
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %5

; <label>:15                                      ; preds = %5
  store i32 0, i32* %2, align 4
  br label %16

; <label>:16                                      ; preds = %23, %15
  %17 = load i32* %2, align 4
  %18 = icmp ult i32 %17, 0
  br i1 %18, label %19, label %28

; <label>:19                                      ; preds = %16
  %20 = load volatile i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  %21 = call i32* @func_32(i32 %20)
  %22 = load i32*** %1, align 8
  store i32* %21, i32** %22
  br label %23

; <label>:23                                      ; preds = %19
  %24 = load i32* %2, align 4
  %25 = trunc i32 %24 to i16
  %26 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %25, i16 signext 7)
  %27 = sext i16 %26 to i32
  store i32 %27, i32* %2, align 4
  br label %16

; <label>:28                                      ; preds = %16
  %29 = getelementptr inbounds [1 x i32]* %l_54, i32 0, i64 0
  %30 = load i32* %29, align 4
  %31 = load i8* %l_55, align 1
  %32 = zext i8 %31 to i32
  %33 = xor i32 %32, %30
  %34 = trunc i32 %33 to i8
  store i8 %34, i8* %l_55, align 1
  %35 = load i32*** %1, align 8
  %36 = load i32** %35
  ret i32* %36
}

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_11, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 1), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 3), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load i32* @g_29, align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0), i32 %17)
  %19 = load i32* %1
  ret i32 %19
}

declare i32 @printf(i8*, ...)
