; ModuleID = './bitfields.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.bfs = type { [8 x i8], [2 x i8], [2 x i8], [2 x i8], [2 x i8], i8, [3 x i8] }

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

; Function Attrs: nounwind uwtable
define i32 @testOnes() #0 {
  %firstChar = alloca i8, align 1
  %1 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %2 = and i64 %1, -2
  store i64 %2, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %3 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %4 = and i64 %3, -3
  store i64 %4, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %5 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %6 = and i64 %5, -5
  store i64 %6, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %7 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %8 = and i64 %7, -9
  store i64 %8, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %9 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %10 = and i64 %9, -17
  store i64 %10, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %11 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %12 = and i64 %11, -33
  store i64 %12, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %13 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %14 = and i64 %13, -65
  store i64 %14, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %15 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %16 = and i64 %15, -129
  store i64 %16, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %17 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %18 = and i64 %17, 1
  %19 = trunc i64 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %0
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %23

; <label>:23                                      ; preds = %21, %0
  %24 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %25 = lshr i64 %24, 1
  %26 = and i64 %25, 1
  %27 = trunc i64 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %23
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %31

; <label>:31                                      ; preds = %29, %23
  %32 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %33 = lshr i64 %32, 2
  %34 = and i64 %33, 1
  %35 = trunc i64 %34 to i32
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %39

; <label>:37                                      ; preds = %31
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %39

; <label>:39                                      ; preds = %37, %31
  %40 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %41 = lshr i64 %40, 3
  %42 = and i64 %41, 1
  %43 = trunc i64 %42 to i32
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %47

; <label>:45                                      ; preds = %39
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %47

; <label>:47                                      ; preds = %45, %39
  %48 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %49 = lshr i64 %48, 4
  %50 = and i64 %49, 1
  %51 = trunc i64 %50 to i32
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %55

; <label>:53                                      ; preds = %47
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %55

; <label>:55                                      ; preds = %53, %47
  %56 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %57 = lshr i64 %56, 5
  %58 = and i64 %57, 1
  %59 = trunc i64 %58 to i32
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %63

; <label>:61                                      ; preds = %55
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %63

; <label>:63                                      ; preds = %61, %55
  %64 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %65 = lshr i64 %64, 6
  %66 = and i64 %65, 1
  %67 = trunc i64 %66 to i32
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %71

; <label>:69                                      ; preds = %63
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %71

; <label>:71                                      ; preds = %69, %63
  %72 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %73 = lshr i64 %72, 7
  %74 = and i64 %73, 1
  %75 = trunc i64 %74 to i32
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %79

; <label>:77                                      ; preds = %71
  %78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %79

; <label>:79                                      ; preds = %77, %71
  %80 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %81 = and i64 %80, -2
  %82 = or i64 %81, 1
  store i64 %82, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %83 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %84 = and i64 %83, -3
  %85 = or i64 %84, 2
  store i64 %85, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %86 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %87 = and i64 %86, -5
  %88 = or i64 %87, 4
  store i64 %88, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %89 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %90 = and i64 %89, -9
  %91 = or i64 %90, 8
  store i64 %91, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %92 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %93 = and i64 %92, -17
  %94 = or i64 %93, 16
  store i64 %94, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %95 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %96 = and i64 %95, -33
  %97 = or i64 %96, 32
  store i64 %97, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %98 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %99 = and i64 %98, -65
  %100 = or i64 %99, 64
  store i64 %100, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %101 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %102 = and i64 %101, -129
  %103 = or i64 %102, 128
  store i64 %103, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %104 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %105 = and i64 %104, 1
  %106 = trunc i64 %105 to i32
  %107 = icmp ne i32 %106, 1
  br i1 %107, label %108, label %110

; <label>:108                                     ; preds = %79
  %109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %110

; <label>:110                                     ; preds = %108, %79
  %111 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %112 = lshr i64 %111, 1
  %113 = and i64 %112, 1
  %114 = trunc i64 %113 to i32
  %115 = icmp ne i32 %114, 1
  br i1 %115, label %116, label %118

; <label>:116                                     ; preds = %110
  %117 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %118

; <label>:118                                     ; preds = %116, %110
  %119 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %120 = lshr i64 %119, 2
  %121 = and i64 %120, 1
  %122 = trunc i64 %121 to i32
  %123 = icmp ne i32 %122, 1
  br i1 %123, label %124, label %126

; <label>:124                                     ; preds = %118
  %125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %126

; <label>:126                                     ; preds = %124, %118
  %127 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %128 = lshr i64 %127, 3
  %129 = and i64 %128, 1
  %130 = trunc i64 %129 to i32
  %131 = icmp ne i32 %130, 1
  br i1 %131, label %132, label %134

; <label>:132                                     ; preds = %126
  %133 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %134

; <label>:134                                     ; preds = %132, %126
  %135 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %136 = lshr i64 %135, 4
  %137 = and i64 %136, 1
  %138 = trunc i64 %137 to i32
  %139 = icmp ne i32 %138, 1
  br i1 %139, label %140, label %142

; <label>:140                                     ; preds = %134
  %141 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %142

; <label>:142                                     ; preds = %140, %134
  %143 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %144 = lshr i64 %143, 5
  %145 = and i64 %144, 1
  %146 = trunc i64 %145 to i32
  %147 = icmp ne i32 %146, 1
  br i1 %147, label %148, label %150

; <label>:148                                     ; preds = %142
  %149 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %150

; <label>:150                                     ; preds = %148, %142
  %151 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %152 = lshr i64 %151, 6
  %153 = and i64 %152, 1
  %154 = trunc i64 %153 to i32
  %155 = icmp ne i32 %154, 1
  br i1 %155, label %156, label %158

; <label>:156                                     ; preds = %150
  %157 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %158

; <label>:158                                     ; preds = %156, %150
  %159 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %160 = lshr i64 %159, 7
  %161 = and i64 %160, 1
  %162 = trunc i64 %161 to i32
  %163 = icmp ne i32 %162, 1
  br i1 %163, label %164, label %166

; <label>:164                                     ; preds = %158
  %165 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %166

; <label>:166                                     ; preds = %164, %158
  %167 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %168 = and i64 %167, -2
  %169 = or i64 %168, 1
  store i64 %169, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %170 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %171 = and i64 %170, -3
  store i64 %171, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %172 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %173 = and i64 %172, -5
  %174 = or i64 %173, 4
  store i64 %174, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %175 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %176 = and i64 %175, -9
  %177 = or i64 %176, 8
  store i64 %177, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %178 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %179 = and i64 %178, -17
  store i64 %179, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %180 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %181 = and i64 %180, -33
  %182 = or i64 %181, 32
  store i64 %182, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %183 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %184 = and i64 %183, -65
  %185 = or i64 %184, 64
  store i64 %185, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %186 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %187 = and i64 %186, -129
  %188 = or i64 %187, 128
  store i64 %188, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %189 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %190 = and i64 %189, 1
  %191 = trunc i64 %190 to i32
  %192 = icmp ne i32 %191, 1
  br i1 %192, label %193, label %195

; <label>:193                                     ; preds = %166
  %194 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %195

; <label>:195                                     ; preds = %193, %166
  %196 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %197 = lshr i64 %196, 1
  %198 = and i64 %197, 1
  %199 = trunc i64 %198 to i32
  %200 = icmp ne i32 %199, 0
  br i1 %200, label %201, label %203

; <label>:201                                     ; preds = %195
  %202 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %203

; <label>:203                                     ; preds = %201, %195
  %204 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %205 = lshr i64 %204, 2
  %206 = and i64 %205, 1
  %207 = trunc i64 %206 to i32
  %208 = icmp ne i32 %207, 1
  br i1 %208, label %209, label %211

; <label>:209                                     ; preds = %203
  %210 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %211

; <label>:211                                     ; preds = %209, %203
  %212 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %213 = lshr i64 %212, 3
  %214 = and i64 %213, 1
  %215 = trunc i64 %214 to i32
  %216 = icmp ne i32 %215, 1
  br i1 %216, label %217, label %219

; <label>:217                                     ; preds = %211
  %218 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %219

; <label>:219                                     ; preds = %217, %211
  %220 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %221 = lshr i64 %220, 4
  %222 = and i64 %221, 1
  %223 = trunc i64 %222 to i32
  %224 = icmp ne i32 %223, 0
  br i1 %224, label %225, label %227

; <label>:225                                     ; preds = %219
  %226 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %227

; <label>:227                                     ; preds = %225, %219
  %228 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %229 = lshr i64 %228, 5
  %230 = and i64 %229, 1
  %231 = trunc i64 %230 to i32
  %232 = icmp ne i32 %231, 1
  br i1 %232, label %233, label %235

; <label>:233                                     ; preds = %227
  %234 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %235

; <label>:235                                     ; preds = %233, %227
  %236 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %237 = lshr i64 %236, 6
  %238 = and i64 %237, 1
  %239 = trunc i64 %238 to i32
  %240 = icmp ne i32 %239, 1
  br i1 %240, label %241, label %243

; <label>:241                                     ; preds = %235
  %242 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %243

; <label>:243                                     ; preds = %241, %235
  %244 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %245 = lshr i64 %244, 7
  %246 = and i64 %245, 1
  %247 = trunc i64 %246 to i32
  %248 = icmp ne i32 %247, 1
  br i1 %248, label %249, label %251

; <label>:249                                     ; preds = %243
  %250 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %251

; <label>:251                                     ; preds = %249, %243
  %252 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %253 = and i64 %252, -65
  store i64 %253, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %254 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %255 = lshr i64 %254, 5
  %256 = and i64 %255, 1
  %257 = trunc i64 %256 to i32
  %258 = icmp ne i32 %257, 1
  br i1 %258, label %259, label %261

; <label>:259                                     ; preds = %251
  %260 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %261

; <label>:261                                     ; preds = %259, %251
  %262 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %263 = lshr i64 %262, 6
  %264 = and i64 %263, 1
  %265 = trunc i64 %264 to i32
  %266 = icmp ne i32 %265, 0
  br i1 %266, label %267, label %269

; <label>:267                                     ; preds = %261
  %268 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %269

; <label>:269                                     ; preds = %267, %261
  %270 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %271 = lshr i64 %270, 7
  %272 = and i64 %271, 1
  %273 = trunc i64 %272 to i32
  %274 = icmp ne i32 %273, 1
  br i1 %274, label %275, label %277

; <label>:275                                     ; preds = %269
  %276 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %277

; <label>:277                                     ; preds = %275, %269
  %278 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0, i32 0), align 1
  store i8 %278, i8* %firstChar, align 1
  %279 = load i8* %firstChar, align 1
  %280 = zext i8 %279 to i32
  %281 = icmp eq i32 %280, 181
  br i1 %281, label %282, label %284

; <label>:282                                     ; preds = %277
  %283 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0))
  br label %295

; <label>:284                                     ; preds = %277
  %285 = load i8* %firstChar, align 1
  %286 = zext i8 %285 to i32
  %287 = icmp eq i32 %286, 173
  br i1 %287, label %288, label %290

; <label>:288                                     ; preds = %284
  %289 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0))
  br label %294

; <label>:290                                     ; preds = %284
  %291 = load i8* %firstChar, align 1
  %292 = zext i8 %291 to i32
  %293 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str5, i32 0, i32 0), i32 %292)
  br label %294

; <label>:294                                     ; preds = %290, %288
  br label %295

; <label>:295                                     ; preds = %294, %282
  %296 = load %struct.bfs** @p, align 8
  %297 = bitcast %struct.bfs* %296 to i64*
  %298 = load i64* %297, align 4
  %299 = and i64 %298, -65
  %300 = or i64 %299, 64
  store i64 %300, i64* %297, align 4
  %301 = load %struct.bfs** @p, align 8
  %302 = bitcast %struct.bfs* %301 to i64*
  %303 = load i64* %302, align 4
  %304 = lshr i64 %303, 5
  %305 = and i64 %304, 1
  %306 = trunc i64 %305 to i32
  %307 = icmp ne i32 %306, 1
  br i1 %307, label %308, label %310

; <label>:308                                     ; preds = %295
  %309 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0))
  br label %310

; <label>:310                                     ; preds = %308, %295
  %311 = load %struct.bfs** @p, align 8
  %312 = bitcast %struct.bfs* %311 to i64*
  %313 = load i64* %312, align 4
  %314 = lshr i64 %313, 6
  %315 = and i64 %314, 1
  %316 = trunc i64 %315 to i32
  %317 = icmp ne i32 %316, 1
  br i1 %317, label %318, label %320

; <label>:318                                     ; preds = %310
  %319 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0))
  br label %320

; <label>:320                                     ; preds = %318, %310
  %321 = load %struct.bfs** @p, align 8
  %322 = bitcast %struct.bfs* %321 to i64*
  %323 = load i64* %322, align 4
  %324 = lshr i64 %323, 7
  %325 = and i64 %324, 1
  %326 = trunc i64 %325 to i32
  %327 = icmp ne i32 %326, 1
  br i1 %327, label %328, label %330

; <label>:328                                     ; preds = %320
  %329 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0))
  br label %330

; <label>:330                                     ; preds = %328, %320
  %331 = load %struct.bfs** @p, align 8
  %332 = bitcast %struct.bfs* %331 to i64*
  %333 = load i64* %332, align 4
  %334 = and i64 %333, -33
  store i64 %334, i64* %332, align 4
  %335 = load %struct.bfs** @p, align 8
  %336 = bitcast %struct.bfs* %335 to i64*
  %337 = load i64* %336, align 4
  %338 = and i64 %337, -129
  store i64 %338, i64* %336, align 4
  %339 = load %struct.bfs** @p, align 8
  %340 = bitcast %struct.bfs* %339 to i64*
  %341 = load i64* %340, align 4
  %342 = and i64 %341, -65
  %343 = or i64 %342, 64
  store i64 %343, i64* %340, align 4
  %344 = load %struct.bfs** @p, align 8
  %345 = bitcast %struct.bfs* %344 to i64*
  %346 = load i64* %345, align 4
  %347 = lshr i64 %346, 5
  %348 = and i64 %347, 1
  %349 = trunc i64 %348 to i32
  %350 = icmp ne i32 %349, 0
  br i1 %350, label %351, label %353

; <label>:351                                     ; preds = %330
  %352 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0))
  br label %353

; <label>:353                                     ; preds = %351, %330
  %354 = load %struct.bfs** @p, align 8
  %355 = bitcast %struct.bfs* %354 to i64*
  %356 = load i64* %355, align 4
  %357 = lshr i64 %356, 6
  %358 = and i64 %357, 1
  %359 = trunc i64 %358 to i32
  %360 = icmp ne i32 %359, 1
  br i1 %360, label %361, label %363

; <label>:361                                     ; preds = %353
  %362 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0))
  br label %363

; <label>:363                                     ; preds = %361, %353
  %364 = load %struct.bfs** @p, align 8
  %365 = bitcast %struct.bfs* %364 to i64*
  %366 = load i64* %365, align 4
  %367 = lshr i64 %366, 7
  %368 = and i64 %367, 1
  %369 = trunc i64 %368 to i32
  %370 = icmp ne i32 %369, 0
  br i1 %370, label %371, label %373

; <label>:371                                     ; preds = %363
  %372 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0))
  br label %373

; <label>:373                                     ; preds = %371, %363
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @testTwos() #0 {
  %firstChar = alloca i8, align 1
  %1 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %2 = and i64 %1, -769
  store i64 %2, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %3 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %4 = and i64 %3, -3073
  store i64 %4, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %5 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %6 = and i64 %5, -12289
  store i64 %6, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %7 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %8 = and i64 %7, -49153
  store i64 %8, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %9 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %10 = lshr i64 %9, 8
  %11 = and i64 %10, 3
  %12 = trunc i64 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14                                      ; preds = %0
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %16

; <label>:16                                      ; preds = %14, %0
  %17 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %18 = lshr i64 %17, 10
  %19 = and i64 %18, 3
  %20 = trunc i64 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %24

; <label>:22                                      ; preds = %16
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %24

; <label>:24                                      ; preds = %22, %16
  %25 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %26 = lshr i64 %25, 12
  %27 = and i64 %26, 3
  %28 = trunc i64 %27 to i32
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30                                      ; preds = %24
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %32

; <label>:32                                      ; preds = %30, %24
  %33 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %34 = lshr i64 %33, 14
  %35 = and i64 %34, 3
  %36 = trunc i64 %35 to i32
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %40

; <label>:38                                      ; preds = %32
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %40

; <label>:40                                      ; preds = %38, %32
  %41 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %42 = and i64 %41, -769
  %43 = or i64 %42, 256
  store i64 %43, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %44 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %45 = and i64 %44, -3073
  %46 = or i64 %45, 1024
  store i64 %46, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %47 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %48 = and i64 %47, -12289
  %49 = or i64 %48, 4096
  store i64 %49, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %50 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %51 = and i64 %50, -49153
  %52 = or i64 %51, 16384
  store i64 %52, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %53 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %54 = lshr i64 %53, 8
  %55 = and i64 %54, 3
  %56 = trunc i64 %55 to i32
  %57 = icmp ne i32 %56, 1
  br i1 %57, label %58, label %60

; <label>:58                                      ; preds = %40
  %59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0))
  br label %60

; <label>:60                                      ; preds = %58, %40
  %61 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %62 = lshr i64 %61, 10
  %63 = and i64 %62, 3
  %64 = trunc i64 %63 to i32
  %65 = icmp ne i32 %64, 1
  br i1 %65, label %66, label %68

; <label>:66                                      ; preds = %60
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0))
  br label %68

; <label>:68                                      ; preds = %66, %60
  %69 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %70 = lshr i64 %69, 12
  %71 = and i64 %70, 3
  %72 = trunc i64 %71 to i32
  %73 = icmp ne i32 %72, 1
  br i1 %73, label %74, label %76

; <label>:74                                      ; preds = %68
  %75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0))
  br label %76

; <label>:76                                      ; preds = %74, %68
  %77 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %78 = lshr i64 %77, 14
  %79 = and i64 %78, 3
  %80 = trunc i64 %79 to i32
  %81 = icmp ne i32 %80, 1
  br i1 %81, label %82, label %84

; <label>:82                                      ; preds = %76
  %83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0))
  br label %84

; <label>:84                                      ; preds = %82, %76
  %85 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %86 = and i64 %85, -769
  %87 = or i64 %86, 512
  store i64 %87, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %88 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %89 = and i64 %88, -3073
  %90 = or i64 %89, 2048
  store i64 %90, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %91 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %92 = and i64 %91, -12289
  %93 = or i64 %92, 8192
  store i64 %93, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %94 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %95 = and i64 %94, -49153
  %96 = or i64 %95, 32768
  store i64 %96, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %97 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %98 = lshr i64 %97, 8
  %99 = and i64 %98, 3
  %100 = trunc i64 %99 to i32
  %101 = icmp ne i32 %100, 2
  br i1 %101, label %102, label %104

; <label>:102                                     ; preds = %84
  %103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0))
  br label %104

; <label>:104                                     ; preds = %102, %84
  %105 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %106 = lshr i64 %105, 10
  %107 = and i64 %106, 3
  %108 = trunc i64 %107 to i32
  %109 = icmp ne i32 %108, 2
  br i1 %109, label %110, label %112

; <label>:110                                     ; preds = %104
  %111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0))
  br label %112

; <label>:112                                     ; preds = %110, %104
  %113 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %114 = lshr i64 %113, 12
  %115 = and i64 %114, 3
  %116 = trunc i64 %115 to i32
  %117 = icmp ne i32 %116, 2
  br i1 %117, label %118, label %120

; <label>:118                                     ; preds = %112
  %119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0))
  br label %120

; <label>:120                                     ; preds = %118, %112
  %121 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %122 = lshr i64 %121, 14
  %123 = and i64 %122, 3
  %124 = trunc i64 %123 to i32
  %125 = icmp ne i32 %124, 2
  br i1 %125, label %126, label %128

; <label>:126                                     ; preds = %120
  %127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0))
  br label %128

; <label>:128                                     ; preds = %126, %120
  %129 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %130 = and i64 %129, -769
  %131 = or i64 %130, 256
  store i64 %131, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %132 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %133 = and i64 %132, -3073
  store i64 %133, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %134 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %135 = and i64 %134, -12289
  %136 = or i64 %135, 8192
  store i64 %136, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %137 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %138 = and i64 %137, -49153
  %139 = or i64 %138, 49152
  store i64 %139, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %140 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %141 = lshr i64 %140, 8
  %142 = and i64 %141, 3
  %143 = trunc i64 %142 to i32
  %144 = icmp ne i32 %143, 1
  br i1 %144, label %145, label %147

; <label>:145                                     ; preds = %128
  %146 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str11, i32 0, i32 0))
  br label %147

; <label>:147                                     ; preds = %145, %128
  %148 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %149 = lshr i64 %148, 10
  %150 = and i64 %149, 3
  %151 = trunc i64 %150 to i32
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %153, label %155

; <label>:153                                     ; preds = %147
  %154 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str11, i32 0, i32 0))
  br label %155

; <label>:155                                     ; preds = %153, %147
  %156 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %157 = lshr i64 %156, 12
  %158 = and i64 %157, 3
  %159 = trunc i64 %158 to i32
  %160 = icmp ne i32 %159, 2
  br i1 %160, label %161, label %163

; <label>:161                                     ; preds = %155
  %162 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str11, i32 0, i32 0))
  br label %163

; <label>:163                                     ; preds = %161, %155
  %164 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %165 = lshr i64 %164, 14
  %166 = and i64 %165, 3
  %167 = trunc i64 %166 to i32
  %168 = icmp ne i32 %167, 3
  br i1 %168, label %169, label %171

; <label>:169                                     ; preds = %163
  %170 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str11, i32 0, i32 0))
  br label %171

; <label>:171                                     ; preds = %169, %163
  %172 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %173 = and i64 %172, -769
  %174 = or i64 %173, 768
  store i64 %174, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %175 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %176 = and i64 %175, -3073
  %177 = or i64 %176, 2048
  store i64 %177, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %178 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %179 = and i64 %178, -12289
  store i64 %179, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %180 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %181 = and i64 %180, -49153
  %182 = or i64 %181, 16384
  store i64 %182, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %183 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %184 = lshr i64 %183, 8
  %185 = and i64 %184, 3
  %186 = trunc i64 %185 to i32
  %187 = icmp ne i32 %186, 3
  br i1 %187, label %188, label %190

; <label>:188                                     ; preds = %171
  %189 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str12, i32 0, i32 0))
  br label %190

; <label>:190                                     ; preds = %188, %171
  %191 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %192 = lshr i64 %191, 10
  %193 = and i64 %192, 3
  %194 = trunc i64 %193 to i32
  %195 = icmp ne i32 %194, 2
  br i1 %195, label %196, label %198

; <label>:196                                     ; preds = %190
  %197 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str12, i32 0, i32 0))
  br label %198

; <label>:198                                     ; preds = %196, %190
  %199 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %200 = lshr i64 %199, 12
  %201 = and i64 %200, 3
  %202 = trunc i64 %201 to i32
  %203 = icmp ne i32 %202, 0
  br i1 %203, label %204, label %206

; <label>:204                                     ; preds = %198
  %205 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str12, i32 0, i32 0))
  br label %206

; <label>:206                                     ; preds = %204, %198
  %207 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %208 = lshr i64 %207, 14
  %209 = and i64 %208, 3
  %210 = trunc i64 %209 to i32
  %211 = icmp ne i32 %210, 1
  br i1 %211, label %212, label %214

; <label>:212                                     ; preds = %206
  %213 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str12, i32 0, i32 0))
  br label %214

; <label>:214                                     ; preds = %212, %206
  %215 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0, i64 1), align 1
  store i8 %215, i8* %firstChar, align 1
  %216 = load i8* %firstChar, align 1
  %217 = zext i8 %216 to i32
  %218 = icmp eq i32 %217, 135
  br i1 %218, label %227, label %219

; <label>:219                                     ; preds = %214
  %220 = load i8* %firstChar, align 1
  %221 = zext i8 %220 to i32
  %222 = icmp eq i32 %221, 75
  br i1 %222, label %227, label %223

; <label>:223                                     ; preds = %219
  %224 = load i8* %firstChar, align 1
  %225 = zext i8 %224 to i32
  %226 = icmp eq i32 %225, 225
  br i1 %226, label %227, label %229

; <label>:227                                     ; preds = %223, %219, %214
  %228 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0))
  br label %233

; <label>:229                                     ; preds = %223
  %230 = load i8* %firstChar, align 1
  %231 = zext i8 %230 to i32
  %232 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str13, i32 0, i32 0), i32 %231)
  br label %233

; <label>:233                                     ; preds = %229, %227
  %234 = load %struct.bfs** @p, align 8
  %235 = bitcast %struct.bfs* %234 to i64*
  %236 = load i64* %235, align 4
  %237 = and i64 %236, -12289
  %238 = or i64 %237, 12288
  store i64 %238, i64* %235, align 4
  %239 = load %struct.bfs** @p, align 8
  %240 = bitcast %struct.bfs* %239 to i64*
  %241 = load i64* %240, align 4
  %242 = lshr i64 %241, 10
  %243 = and i64 %242, 3
  %244 = trunc i64 %243 to i32
  %245 = icmp ne i32 %244, 2
  br i1 %245, label %246, label %248

; <label>:246                                     ; preds = %233
  %247 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str14, i32 0, i32 0))
  br label %248

; <label>:248                                     ; preds = %246, %233
  %249 = load %struct.bfs** @p, align 8
  %250 = bitcast %struct.bfs* %249 to i64*
  %251 = load i64* %250, align 4
  %252 = lshr i64 %251, 12
  %253 = and i64 %252, 3
  %254 = trunc i64 %253 to i32
  %255 = icmp ne i32 %254, 3
  br i1 %255, label %256, label %258

; <label>:256                                     ; preds = %248
  %257 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str14, i32 0, i32 0))
  br label %258

; <label>:258                                     ; preds = %256, %248
  %259 = load %struct.bfs** @p, align 8
  %260 = bitcast %struct.bfs* %259 to i64*
  %261 = load i64* %260, align 4
  %262 = lshr i64 %261, 14
  %263 = and i64 %262, 3
  %264 = trunc i64 %263 to i32
  %265 = icmp ne i32 %264, 1
  br i1 %265, label %266, label %268

; <label>:266                                     ; preds = %258
  %267 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str14, i32 0, i32 0))
  br label %268

; <label>:268                                     ; preds = %266, %258
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @testEights() #0 {
  %firstChar = alloca i8, align 1
  %1 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %2 = and i64 %1, -4278190081
  %3 = or i64 %2, 3070230528
  store i64 %3, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %4 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %5 = lshr i64 %4, 24
  %6 = and i64 %5, 255
  %7 = trunc i64 %6 to i32
  %8 = icmp ne i32 %7, 183
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str15, i32 0, i32 0))
  br label %11

; <label>:11                                      ; preds = %9, %0
  %12 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %13 = and i64 %12, -4278190081
  %14 = or i64 %13, 1258291200
  store i64 %14, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %15 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %16 = lshr i64 %15, 24
  %17 = and i64 %16, 255
  %18 = trunc i64 %17 to i32
  %19 = icmp ne i32 %18, 75
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %11
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str16, i32 0, i32 0))
  br label %22

; <label>:22                                      ; preds = %20, %11
  %23 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0, i64 3), align 1
  store i8 %23, i8* %firstChar, align 1
  %24 = load i8* %firstChar, align 1
  %25 = zext i8 %24 to i32
  %26 = icmp eq i32 %25, 75
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %22
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0))
  br label %33

; <label>:29                                      ; preds = %22
  %30 = load i8* %firstChar, align 1
  %31 = zext i8 %30 to i32
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str17, i32 0, i32 0), i32 %31)
  br label %33

; <label>:33                                      ; preds = %29, %27
  %34 = load %struct.bfs** @p, align 8
  %35 = bitcast %struct.bfs* %34 to i64*
  %36 = load i64* %35, align 4
  %37 = and i64 %36, -4278190081
  %38 = or i64 %37, 1879048192
  store i64 %38, i64* %35, align 4
  %39 = load %struct.bfs** @p, align 8
  %40 = bitcast %struct.bfs* %39 to i64*
  %41 = load i64* %40, align 4
  %42 = lshr i64 %41, 24
  %43 = and i64 %42, 255
  %44 = trunc i64 %43 to i32
  %45 = icmp ne i32 %44, 112
  br i1 %45, label %46, label %48

; <label>:46                                      ; preds = %33
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str18, i32 0, i32 0))
  br label %48

; <label>:48                                      ; preds = %46, %33
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @testSixteens() #0 {
  %firstChar = alloca i16, align 2
  %1 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %2 = and i64 %1, -281470681743361
  %3 = or i64 %2, 129720897241088
  store i64 %3, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %4 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %5 = lshr i64 %4, 32
  %6 = and i64 %5, 65535
  %7 = trunc i64 %6 to i32
  %8 = icmp ne i32 %7, 30203
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str19, i32 0, i32 0))
  br label %11

; <label>:11                                      ; preds = %9, %0
  %12 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %13 = and i64 %12, -281470681743361
  %14 = or i64 %13, 99699075842048
  store i64 %14, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %15 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %16 = lshr i64 %15, 32
  %17 = and i64 %16, 65535
  %18 = trunc i64 %17 to i32
  %19 = icmp ne i32 %18, 23213
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %11
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str20, i32 0, i32 0))
  br label %22

; <label>:22                                      ; preds = %20, %11
  %23 = load i16* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 0, i64 4) to i16*), align 2
  store i16 %23, i16* %firstChar, align 2
  %24 = load i16* %firstChar, align 2
  %25 = zext i16 %24 to i32
  %26 = icmp eq i32 %25, 23213
  br i1 %26, label %31, label %27

; <label>:27                                      ; preds = %22
  %28 = load i16* %firstChar, align 2
  %29 = zext i16 %28 to i32
  %30 = icmp eq i32 %29, 44378
  br i1 %30, label %31, label %33

; <label>:31                                      ; preds = %27, %22
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str21, i32 0, i32 0))
  br label %37

; <label>:33                                      ; preds = %27
  %34 = load i16* %firstChar, align 2
  %35 = zext i16 %34 to i32
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 %35)
  br label %37

; <label>:37                                      ; preds = %33, %31
  %38 = load %struct.bfs** @p, align 8
  %39 = bitcast %struct.bfs* %38 to i64*
  %40 = load i64* %39, align 4
  %41 = and i64 %40, -281470681743361
  %42 = or i64 %41, 49847390437376
  store i64 %42, i64* %39, align 4
  %43 = load %struct.bfs** @p, align 8
  %44 = bitcast %struct.bfs* %43 to i64*
  %45 = load i64* %44, align 4
  %46 = lshr i64 %45, 32
  %47 = and i64 %46, 65535
  %48 = trunc i64 %47 to i32
  %49 = icmp ne i32 %48, 11606
  br i1 %49, label %50, label %52

; <label>:50                                      ; preds = %37
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str23, i32 0, i32 0))
  br label %52

; <label>:52                                      ; preds = %50, %37
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @testPartial() #0 {
  %firstChar = alloca i8, align 1
  %1 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %2 = and i64 %1, -17732923532771329
  %3 = or i64 %2, 12666373951979520
  store i64 %3, i64* bitcast (%struct.bfs* @s to i64*), align 4
  store i8 -111, i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 5), align 1
  %4 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %5 = lshr i64 %4, 48
  %6 = and i64 %5, 63
  %7 = trunc i64 %6 to i32
  %8 = icmp ne i32 %7, 45
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str24, i32 0, i32 0))
  br label %11

; <label>:11                                      ; preds = %9, %0
  %12 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 5), align 1
  %13 = zext i8 %12 to i32
  %14 = icmp ne i32 %13, 145
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %11
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str24, i32 0, i32 0))
  br label %17

; <label>:17                                      ; preds = %15, %11
  store i8 75, i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 5), align 1
  %18 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %19 = lshr i64 %18, 48
  %20 = and i64 %19, 63
  %21 = trunc i64 %20 to i32
  %22 = icmp ne i32 %21, 45
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %17
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str25, i32 0, i32 0))
  br label %25

; <label>:25                                      ; preds = %23, %17
  %26 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 5), align 1
  %27 = zext i8 %26 to i32
  %28 = icmp ne i32 %27, 75
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %25
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str25, i32 0, i32 0))
  br label %31

; <label>:31                                      ; preds = %29, %25
  %32 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %33 = and i64 %32, -17732923532771329
  %34 = or i64 %33, 5910974510923776
  store i64 %34, i64* bitcast (%struct.bfs* @s to i64*), align 4
  %35 = load i64* bitcast (%struct.bfs* @s to i64*), align 4
  %36 = lshr i64 %35, 48
  %37 = and i64 %36, 63
  %38 = trunc i64 %37 to i32
  %39 = icmp ne i32 %38, 21
  br i1 %39, label %40, label %42

; <label>:40                                      ; preds = %31
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str26, i32 0, i32 0))
  br label %42

; <label>:42                                      ; preds = %40, %31
  %43 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 5), align 1
  %44 = zext i8 %43 to i32
  %45 = icmp ne i32 %44, 75
  br i1 %45, label %46, label %48

; <label>:46                                      ; preds = %42
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str26, i32 0, i32 0))
  br label %48

; <label>:48                                      ; preds = %46, %42
  %49 = load i8* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 5), align 1
  store i8 %49, i8* %firstChar, align 1
  %50 = load i8* %firstChar, align 1
  %51 = zext i8 %50 to i32
  %52 = icmp eq i32 %51, 75
  br i1 %52, label %53, label %55

; <label>:53                                      ; preds = %48
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str27, i32 0, i32 0))
  br label %59

; <label>:55                                      ; preds = %48
  %56 = load i8* %firstChar, align 1
  %57 = zext i8 %56 to i32
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str28, i32 0, i32 0), i32 %57)
  br label %59

; <label>:59                                      ; preds = %55, %53
  %60 = load %struct.bfs** @p, align 8
  %61 = getelementptr inbounds %struct.bfs* %60, i32 0, i32 5
  store i8 119, i8* %61, align 1
  %62 = load %struct.bfs** @p, align 8
  %63 = getelementptr inbounds %struct.bfs* %62, i32 0, i32 5
  %64 = load i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp ne i32 %65, 119
  br i1 %66, label %67, label %69

; <label>:67                                      ; preds = %59
  %68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str29, i32 0, i32 0))
  br label %69

; <label>:69                                      ; preds = %67, %59
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @testBigPartial() #0 {
  %1 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %2 = and i16 %1, -8192
  %3 = or i16 %2, 45
  store i16 %3, i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %4 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %5 = and i16 %4, 8191
  %6 = or i16 %5, 16384
  store i16 %6, i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %7 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %8 = and i16 %7, 8191
  %9 = zext i16 %8 to i32
  %10 = icmp ne i32 %9, 45
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %0
  %12 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %13 = and i16 %12, 8191
  %14 = zext i16 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str30, i32 0, i32 0), i32 %14)
  br label %16

; <label>:16                                      ; preds = %11, %0
  %17 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %18 = lshr i16 %17, 13
  %19 = zext i16 %18 to i32
  %20 = icmp ne i32 %19, 2
  br i1 %20, label %21, label %26

; <label>:21                                      ; preds = %16
  %22 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %23 = lshr i16 %22, 13
  %24 = zext i16 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str31, i32 0, i32 0), i32 %24)
  br label %26

; <label>:26                                      ; preds = %21, %16
  %27 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %28 = and i16 %27, 8191
  %29 = or i16 %28, -8192
  store i16 %29, i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %30 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %31 = and i16 %30, 8191
  %32 = zext i16 %31 to i32
  %33 = icmp ne i32 %32, 45
  br i1 %33, label %34, label %39

; <label>:34                                      ; preds = %26
  %35 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %36 = and i16 %35, 8191
  %37 = zext i16 %36 to i32
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str32, i32 0, i32 0), i32 %37)
  br label %39

; <label>:39                                      ; preds = %34, %26
  %40 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %41 = lshr i16 %40, 13
  %42 = zext i16 %41 to i32
  %43 = icmp ne i32 %42, 7
  br i1 %43, label %44, label %49

; <label>:44                                      ; preds = %39
  %45 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %46 = lshr i16 %45, 13
  %47 = zext i16 %46 to i32
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i32 %47)
  br label %49

; <label>:49                                      ; preds = %44, %39
  %50 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %51 = and i16 %50, -8192
  %52 = or i16 %51, 3073
  store i16 %52, i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %53 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %54 = and i16 %53, 8191
  %55 = zext i16 %54 to i32
  %56 = icmp ne i32 %55, 3073
  br i1 %56, label %57, label %62

; <label>:57                                      ; preds = %49
  %58 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %59 = and i16 %58, 8191
  %60 = zext i16 %59 to i32
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str34, i32 0, i32 0), i32 %60)
  br label %62

; <label>:62                                      ; preds = %57, %49
  %63 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %64 = lshr i16 %63, 13
  %65 = zext i16 %64 to i32
  %66 = icmp ne i32 %65, 7
  br i1 %66, label %67, label %72

; <label>:67                                      ; preds = %62
  %68 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %69 = lshr i16 %68, 13
  %70 = zext i16 %69 to i32
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str35, i32 0, i32 0), i32 %70)
  br label %72

; <label>:72                                      ; preds = %67, %62
  %73 = load %struct.bfs** @p, align 8
  %74 = getelementptr inbounds %struct.bfs* %73, i32 0, i32 1
  %75 = bitcast [2 x i8]* %74 to i16*
  %76 = load i16* %75, align 4
  %77 = and i16 %76, -8192
  %78 = or i16 %77, 2000
  store i16 %78, i16* %75, align 4
  %79 = load %struct.bfs** @p, align 8
  %80 = getelementptr inbounds %struct.bfs* %79, i32 0, i32 1
  %81 = bitcast [2 x i8]* %80 to i16*
  %82 = load i16* %81, align 4
  %83 = and i16 %82, 8191
  %84 = zext i16 %83 to i32
  %85 = icmp ne i32 %84, 2000
  br i1 %85, label %86, label %97

; <label>:86                                      ; preds = %72
  %87 = load %struct.bfs** @p, align 8
  %88 = getelementptr inbounds %struct.bfs* %87, i32 0, i32 1
  %89 = bitcast [2 x i8]* %88 to i16*
  %90 = load i16* %89, align 4
  %91 = and i16 %90, 8191
  %92 = zext i16 %91 to i32
  %93 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 1) to i16*), align 4
  %94 = and i16 %93, 8191
  %95 = zext i16 %94 to i32
  %96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str36, i32 0, i32 0), i32 %92, i32 %95)
  br label %97

; <label>:97                                      ; preds = %86, %72
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @testJustBigPartial() #0 {
  %1 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %2 = and i16 %1, -2048
  %3 = or i16 %2, 45
  store i16 %3, i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %4 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %5 = and i16 %4, 2047
  %6 = zext i16 %5 to i32
  %7 = icmp ne i32 %6, 45
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %0
  %9 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %10 = and i16 %9, 2047
  %11 = zext i16 %10 to i32
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str37, i32 0, i32 0), i32 %11)
  br label %13

; <label>:13                                      ; preds = %8, %0
  %14 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %15 = and i16 %14, -2048
  %16 = or i16 %15, 7
  store i16 %16, i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %17 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %18 = and i16 %17, 2047
  %19 = zext i16 %18 to i32
  %20 = icmp ne i32 %19, 7
  br i1 %20, label %21, label %26

; <label>:21                                      ; preds = %13
  %22 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %23 = and i16 %22, 2047
  %24 = zext i16 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str38, i32 0, i32 0), i32 %24)
  br label %26

; <label>:26                                      ; preds = %21, %13
  %27 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %28 = and i16 %27, -2048
  %29 = or i16 %28, 1137
  store i16 %29, i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %30 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %31 = and i16 %30, 2047
  %32 = zext i16 %31 to i32
  %33 = icmp ne i32 %32, 1137
  br i1 %33, label %34, label %39

; <label>:34                                      ; preds = %26
  %35 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %36 = and i16 %35, 2047
  %37 = zext i16 %36 to i32
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str39, i32 0, i32 0), i32 %37)
  br label %39

; <label>:39                                      ; preds = %34, %26
  %40 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %41 = and i16 %40, -2048
  %42 = or i16 %41, 601
  store i16 %42, i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %43 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %44 = and i16 %43, 2047
  %45 = zext i16 %44 to i32
  %46 = icmp ne i32 %45, 601
  br i1 %46, label %47, label %52

; <label>:47                                      ; preds = %39
  %48 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %49 = and i16 %48, 2047
  %50 = zext i16 %49 to i32
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str40, i32 0, i32 0), i32 %50)
  br label %52

; <label>:52                                      ; preds = %47, %39
  %53 = load %struct.bfs** @p, align 8
  %54 = getelementptr inbounds %struct.bfs* %53, i32 0, i32 3
  %55 = bitcast [2 x i8]* %54 to i16*
  %56 = load i16* %55, align 4
  %57 = and i16 %56, -2048
  %58 = or i16 %57, 1025
  store i16 %58, i16* %55, align 4
  %59 = load %struct.bfs** @p, align 8
  %60 = getelementptr inbounds %struct.bfs* %59, i32 0, i32 3
  %61 = bitcast [2 x i8]* %60 to i16*
  %62 = load i16* %61, align 4
  %63 = and i16 %62, 2047
  %64 = zext i16 %63 to i32
  %65 = icmp ne i32 %64, 1025
  br i1 %65, label %66, label %77

; <label>:66                                      ; preds = %52
  %67 = load %struct.bfs** @p, align 8
  %68 = getelementptr inbounds %struct.bfs* %67, i32 0, i32 3
  %69 = bitcast [2 x i8]* %68 to i16*
  %70 = load i16* %69, align 4
  %71 = and i16 %70, 2047
  %72 = zext i16 %71 to i32
  %73 = load i16* bitcast ([2 x i8]* getelementptr inbounds (%struct.bfs* @s, i32 0, i32 3) to i16*), align 4
  %74 = and i16 %73, 2047
  %75 = zext i16 %74 to i32
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str41, i32 0, i32 0), i32 %72, i32 %75)
  br label %77

; <label>:77                                      ; preds = %66, %52
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @testOnes()
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str42, i32 0, i32 0))
  %4 = call i32 @testTwos()
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str43, i32 0, i32 0))
  %6 = call i32 @testEights()
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str44, i32 0, i32 0))
  %8 = call i32 @testSixteens()
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str45, i32 0, i32 0))
  %10 = call i32 @testPartial()
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str46, i32 0, i32 0))
  %12 = call i32 @testJustBigPartial()
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str47, i32 0, i32 0))
  %14 = call i32 @testBigPartial()
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str48, i32 0, i32 0))
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
