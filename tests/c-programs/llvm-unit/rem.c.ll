; ModuleID = './rem.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [37 x i8] c"Test #%u, failed in iteration #: %u\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"Failing test vector:\0A\00", align 1
@.str.2 = private unnamed_addr constant [54 x i8] c"m=%u, x_u=%u, y_u=%u, z_u=%u, x_s=%d, y_s=%d, z_s=%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [26 x i8] c"\0A *** REM test done! ***\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @gcd(i64 %a, i64 %b) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %c = alloca i64, align 8
  store i64 %a, i64* %1, align 8
  store i64 %b, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %0, %11
  %4 = load i64, i64* %1, align 8
  %5 = load i64, i64* %2, align 8
  %6 = srem i64 %4, %5
  store i64 %6, i64* %c, align 8
  %7 = load i64, i64* %c, align 8
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %3
  %10 = load i64, i64* %2, align 8
  ret i64 %10

; <label>:11                                      ; preds = %3
  %12 = load i64, i64* %2, align 8
  store i64 %12, i64* %1, align 8
  %13 = load i64, i64* %c, align 8
  store i64 %13, i64* %2, align 8
  br label %3
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %idx = alloca i32, align 4
  %m = alloca i32, align 4
  %x_u = alloca i32, align 4
  %y_u = alloca i32, align 4
  %z_u = alloca i32, align 4
  %x_s = alloca i32, align 4
  %y_s = alloca i32, align 4
  %z_s = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 0, i32* %idx, align 4
  br label %4

; <label>:4                                       ; preds = %1486, %0
  %5 = load i32, i32* %idx, align 4
  %6 = icmp ult i32 %5, 1
  br i1 %6, label %7, label %1489

; <label>:7                                       ; preds = %4
  %8 = call i32 @rand() #3
  store i32 %8, i32* %m, align 4
  %9 = load i32, i32* %m, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %7
  %12 = load i32, i32* %idx, align 4
  %13 = add i32 %12, -1
  store i32 %13, i32* %idx, align 4
  br label %1486

; <label>:14                                      ; preds = %7
  %15 = call i32 @rand() #3
  store i32 %15, i32* %x_u, align 4
  %16 = call i32 @rand() #3
  store i32 %16, i32* %y_u, align 4
  %17 = call i32 @rand() #3
  store i32 %17, i32* %z_u, align 4
  %18 = call i32 @rand() #3
  %19 = srem i32 %18, 2
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %14
  %22 = call i32 @rand() #3
  br label %26

; <label>:23                                      ; preds = %14
  %24 = call i32 @rand() #3
  %25 = sub nsw i32 0, %24
  br label %26

; <label>:26                                      ; preds = %23, %21
  %27 = phi i32 [ %22, %21 ], [ %25, %23 ]
  store i32 %27, i32* %x_s, align 4
  %28 = call i32 @rand() #3
  %29 = srem i32 %28, 2
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %33

; <label>:31                                      ; preds = %26
  %32 = call i32 @rand() #3
  br label %36

; <label>:33                                      ; preds = %26
  %34 = call i32 @rand() #3
  %35 = sub nsw i32 0, %34
  br label %36

; <label>:36                                      ; preds = %33, %31
  %37 = phi i32 [ %32, %31 ], [ %35, %33 ]
  store i32 %37, i32* %y_s, align 4
  %38 = call i32 @rand() #3
  %39 = srem i32 %38, 2
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41                                      ; preds = %36
  %42 = call i32 @rand() #3
  br label %46

; <label>:43                                      ; preds = %36
  %44 = call i32 @rand() #3
  %45 = sub nsw i32 0, %44
  br label %46

; <label>:46                                      ; preds = %43, %41
  %47 = phi i32 [ %42, %41 ], [ %45, %43 ]
  store i32 %47, i32* %z_s, align 4
  %48 = load i32, i32* %x_s, align 4
  %49 = load i32, i32* %y_s, align 4
  %50 = icmp ne i32 %48, %49
  br i1 %50, label %71, label %51

; <label>:51                                      ; preds = %46
  %52 = load i32, i32* %x_s, align 4
  %53 = load i32, i32* %m, align 4
  %54 = urem i32 %52, %53
  %55 = load i32, i32* %y_s, align 4
  %56 = load i32, i32* %m, align 4
  %57 = urem i32 %55, %56
  %58 = icmp eq i32 %54, %57
  br i1 %58, label %71, label %59

; <label>:59                                      ; preds = %51
  %60 = load i32, i32* %idx, align 4
  %61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 1, i32 %60)
  %62 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %63 = load i32, i32* %m, align 4
  %64 = load i32, i32* %x_u, align 4
  %65 = load i32, i32* %y_u, align 4
  %66 = load i32, i32* %z_u, align 4
  %67 = load i32, i32* %x_s, align 4
  %68 = load i32, i32* %y_s, align 4
  %69 = load i32, i32* %z_s, align 4
  %70 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %63, i32 %64, i32 %65, i32 %66, i32 %67, i32 %68, i32 %69)
  store i32 1, i32* %1
  br label %1491

; <label>:71                                      ; preds = %51, %46
  %72 = load i32, i32* %x_s, align 4
  %73 = load i32, i32* %y_u, align 4
  %74 = icmp ne i32 %72, %73
  br i1 %74, label %95, label %75

; <label>:75                                      ; preds = %71
  %76 = load i32, i32* %x_s, align 4
  %77 = load i32, i32* %m, align 4
  %78 = urem i32 %76, %77
  %79 = load i32, i32* %y_u, align 4
  %80 = load i32, i32* %m, align 4
  %81 = urem i32 %79, %80
  %82 = icmp eq i32 %78, %81
  br i1 %82, label %95, label %83

; <label>:83                                      ; preds = %75
  %84 = load i32, i32* %idx, align 4
  %85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 2, i32 %84)
  %86 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %87 = load i32, i32* %m, align 4
  %88 = load i32, i32* %x_u, align 4
  %89 = load i32, i32* %y_u, align 4
  %90 = load i32, i32* %z_u, align 4
  %91 = load i32, i32* %x_s, align 4
  %92 = load i32, i32* %y_s, align 4
  %93 = load i32, i32* %z_s, align 4
  %94 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %87, i32 %88, i32 %89, i32 %90, i32 %91, i32 %92, i32 %93)
  store i32 1, i32* %1
  br label %1491

; <label>:95                                      ; preds = %75, %71
  %96 = load i32, i32* %x_u, align 4
  %97 = load i32, i32* %y_s, align 4
  %98 = icmp ne i32 %96, %97
  br i1 %98, label %119, label %99

; <label>:99                                      ; preds = %95
  %100 = load i32, i32* %x_u, align 4
  %101 = load i32, i32* %m, align 4
  %102 = urem i32 %100, %101
  %103 = load i32, i32* %y_s, align 4
  %104 = load i32, i32* %m, align 4
  %105 = urem i32 %103, %104
  %106 = icmp eq i32 %102, %105
  br i1 %106, label %119, label %107

; <label>:107                                     ; preds = %99
  %108 = load i32, i32* %idx, align 4
  %109 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 3, i32 %108)
  %110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %111 = load i32, i32* %m, align 4
  %112 = load i32, i32* %x_u, align 4
  %113 = load i32, i32* %y_u, align 4
  %114 = load i32, i32* %z_u, align 4
  %115 = load i32, i32* %x_s, align 4
  %116 = load i32, i32* %y_s, align 4
  %117 = load i32, i32* %z_s, align 4
  %118 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %111, i32 %112, i32 %113, i32 %114, i32 %115, i32 %116, i32 %117)
  store i32 1, i32* %1
  br label %1491

; <label>:119                                     ; preds = %99, %95
  %120 = load i32, i32* %x_u, align 4
  %121 = load i32, i32* %y_u, align 4
  %122 = icmp ne i32 %120, %121
  br i1 %122, label %143, label %123

; <label>:123                                     ; preds = %119
  %124 = load i32, i32* %x_u, align 4
  %125 = load i32, i32* %m, align 4
  %126 = urem i32 %124, %125
  %127 = load i32, i32* %y_u, align 4
  %128 = load i32, i32* %m, align 4
  %129 = urem i32 %127, %128
  %130 = icmp eq i32 %126, %129
  br i1 %130, label %143, label %131

; <label>:131                                     ; preds = %123
  %132 = load i32, i32* %idx, align 4
  %133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 4, i32 %132)
  %134 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %135 = load i32, i32* %m, align 4
  %136 = load i32, i32* %x_u, align 4
  %137 = load i32, i32* %y_u, align 4
  %138 = load i32, i32* %z_u, align 4
  %139 = load i32, i32* %x_s, align 4
  %140 = load i32, i32* %y_s, align 4
  %141 = load i32, i32* %z_s, align 4
  %142 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %135, i32 %136, i32 %137, i32 %138, i32 %139, i32 %140, i32 %141)
  store i32 1, i32* %1
  br label %1491

; <label>:143                                     ; preds = %123, %119
  %144 = load i32, i32* %x_u, align 4
  %145 = load i32, i32* %m, align 4
  %146 = urem i32 %144, %145
  %147 = load i32, i32* %y_u, align 4
  %148 = load i32, i32* %m, align 4
  %149 = urem i32 %147, %148
  %150 = add i32 %146, %149
  %151 = load i32, i32* %x_u, align 4
  %152 = load i32, i32* %m, align 4
  %153 = urem i32 %151, %152
  %154 = icmp ult i32 %150, %153
  br i1 %154, label %189, label %155

; <label>:155                                     ; preds = %143
  %156 = load i32, i32* %x_u, align 4
  %157 = load i32, i32* %y_u, align 4
  %158 = add i32 %156, %157
  %159 = load i32, i32* %x_u, align 4
  %160 = icmp ult i32 %158, %159
  br i1 %160, label %189, label %161

; <label>:161                                     ; preds = %155
  %162 = load i32, i32* %x_u, align 4
  %163 = load i32, i32* %m, align 4
  %164 = urem i32 %162, %163
  %165 = load i32, i32* %y_u, align 4
  %166 = load i32, i32* %m, align 4
  %167 = urem i32 %165, %166
  %168 = add i32 %164, %167
  %169 = load i32, i32* %m, align 4
  %170 = urem i32 %168, %169
  %171 = load i32, i32* %x_u, align 4
  %172 = load i32, i32* %y_u, align 4
  %173 = add i32 %171, %172
  %174 = load i32, i32* %m, align 4
  %175 = urem i32 %173, %174
  %176 = icmp eq i32 %170, %175
  br i1 %176, label %189, label %177

; <label>:177                                     ; preds = %161
  %178 = load i32, i32* %idx, align 4
  %179 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 5, i32 %178)
  %180 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %181 = load i32, i32* %m, align 4
  %182 = load i32, i32* %x_u, align 4
  %183 = load i32, i32* %y_u, align 4
  %184 = load i32, i32* %z_u, align 4
  %185 = load i32, i32* %x_s, align 4
  %186 = load i32, i32* %y_s, align 4
  %187 = load i32, i32* %z_s, align 4
  %188 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %181, i32 %182, i32 %183, i32 %184, i32 %185, i32 %186, i32 %187)
  store i32 1, i32* %1
  br label %1491

; <label>:189                                     ; preds = %161, %155, %143
  %190 = load i32, i32* %y_u, align 4
  %191 = load i32, i32* %z_u, align 4
  %192 = add i32 %190, %191
  %193 = load i32, i32* %y_u, align 4
  %194 = icmp ult i32 %192, %193
  br i1 %194, label %237, label %195

; <label>:195                                     ; preds = %189
  %196 = load i32, i32* %x_u, align 4
  %197 = load i32, i32* %z_u, align 4
  %198 = sub i32 %196, %197
  %199 = load i32, i32* %x_u, align 4
  %200 = icmp ugt i32 %198, %199
  br i1 %200, label %237, label %201

; <label>:201                                     ; preds = %195
  %202 = load i32, i32* %x_u, align 4
  %203 = load i32, i32* %m, align 4
  %204 = urem i32 %202, %203
  %205 = load i32, i32* %y_u, align 4
  %206 = load i32, i32* %z_u, align 4
  %207 = add i32 %205, %206
  %208 = load i32, i32* %m, align 4
  %209 = urem i32 %207, %208
  %210 = icmp eq i32 %204, %209
  %211 = zext i1 %210 to i32
  %212 = load i32, i32* %m, align 4
  %213 = urem i32 %211, %212
  %214 = load i32, i32* %x_u, align 4
  %215 = load i32, i32* %z_u, align 4
  %216 = sub i32 %214, %215
  %217 = load i32, i32* %m, align 4
  %218 = urem i32 %216, %217
  %219 = load i32, i32* %y_u, align 4
  %220 = load i32, i32* %m, align 4
  %221 = urem i32 %219, %220
  %222 = icmp eq i32 %218, %221
  %223 = zext i1 %222 to i32
  %224 = icmp eq i32 %213, %223
  br i1 %224, label %237, label %225

; <label>:225                                     ; preds = %201
  %226 = load i32, i32* %idx, align 4
  %227 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 6, i32 %226)
  %228 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %229 = load i32, i32* %m, align 4
  %230 = load i32, i32* %x_u, align 4
  %231 = load i32, i32* %y_u, align 4
  %232 = load i32, i32* %z_u, align 4
  %233 = load i32, i32* %x_s, align 4
  %234 = load i32, i32* %y_s, align 4
  %235 = load i32, i32* %z_s, align 4
  %236 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %229, i32 %230, i32 %231, i32 %232, i32 %233, i32 %234, i32 %235)
  store i32 1, i32* %1
  br label %1491

; <label>:237                                     ; preds = %201, %195, %189
  %238 = load i32, i32* %y_u, align 4
  %239 = load i32, i32* %m, align 4
  %240 = mul i32 %238, %239
  %241 = load i32, i32* %m, align 4
  %242 = udiv i32 %240, %241
  %243 = load i32, i32* %y_u, align 4
  %244 = icmp ne i32 %242, %243
  br i1 %244, label %277, label %245

; <label>:245                                     ; preds = %237
  %246 = load i32, i32* %x_u, align 4
  %247 = load i32, i32* %y_u, align 4
  %248 = load i32, i32* %m, align 4
  %249 = mul i32 %247, %248
  %250 = add i32 %246, %249
  %251 = load i32, i32* %x_u, align 4
  %252 = icmp ult i32 %250, %251
  br i1 %252, label %277, label %253

; <label>:253                                     ; preds = %245
  %254 = load i32, i32* %x_u, align 4
  %255 = load i32, i32* %m, align 4
  %256 = urem i32 %254, %255
  %257 = load i32, i32* %x_u, align 4
  %258 = load i32, i32* %y_u, align 4
  %259 = load i32, i32* %m, align 4
  %260 = mul i32 %258, %259
  %261 = add i32 %257, %260
  %262 = load i32, i32* %m, align 4
  %263 = urem i32 %261, %262
  %264 = icmp eq i32 %256, %263
  br i1 %264, label %277, label %265

; <label>:265                                     ; preds = %253
  %266 = load i32, i32* %idx, align 4
  %267 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 7, i32 %266)
  %268 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %269 = load i32, i32* %m, align 4
  %270 = load i32, i32* %x_u, align 4
  %271 = load i32, i32* %y_u, align 4
  %272 = load i32, i32* %z_u, align 4
  %273 = load i32, i32* %x_s, align 4
  %274 = load i32, i32* %y_s, align 4
  %275 = load i32, i32* %z_s, align 4
  %276 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %269, i32 %270, i32 %271, i32 %272, i32 %273, i32 %274, i32 %275)
  store i32 1, i32* %1
  br label %1491

; <label>:277                                     ; preds = %253, %245, %237
  %278 = load i32, i32* %z_s, align 4
  %279 = sext i32 %278 to i64
  %280 = load i32, i32* %m, align 4
  %281 = zext i32 %280 to i64
  %282 = call i64 @gcd(i64 %279, i64 %281)
  %283 = icmp ne i64 %282, 1
  br i1 %283, label %339, label %284

; <label>:284                                     ; preds = %277
  %285 = load i32, i32* %z_s, align 4
  %286 = icmp eq i32 %285, 0
  br i1 %286, label %339, label %287

; <label>:287                                     ; preds = %284
  %288 = load i32, i32* %x_s, align 4
  %289 = sext i32 %288 to i64
  %290 = load i32, i32* %z_s, align 4
  %291 = sext i32 %290 to i64
  %292 = call i64 @gcd(i64 %289, i64 %291)
  %293 = load i32, i32* %z_s, align 4
  %294 = sext i32 %293 to i64
  %295 = icmp ne i64 %292, %294
  br i1 %295, label %339, label %296

; <label>:296                                     ; preds = %287
  %297 = load i32, i32* %y_s, align 4
  %298 = sext i32 %297 to i64
  %299 = load i32, i32* %z_s, align 4
  %300 = sext i32 %299 to i64
  %301 = call i64 @gcd(i64 %298, i64 %300)
  %302 = load i32, i32* %z_s, align 4
  %303 = sext i32 %302 to i64
  %304 = icmp ne i64 %301, %303
  br i1 %304, label %339, label %305

; <label>:305                                     ; preds = %296
  %306 = load i32, i32* %x_s, align 4
  %307 = load i32, i32* %m, align 4
  %308 = urem i32 %306, %307
  %309 = load i32, i32* %y_s, align 4
  %310 = load i32, i32* %m, align 4
  %311 = urem i32 %309, %310
  %312 = icmp eq i32 %308, %311
  %313 = zext i1 %312 to i32
  %314 = load i32, i32* %x_s, align 4
  %315 = load i32, i32* %z_s, align 4
  %316 = sdiv i32 %314, %315
  %317 = load i32, i32* %m, align 4
  %318 = urem i32 %316, %317
  %319 = load i32, i32* %y_s, align 4
  %320 = load i32, i32* %z_s, align 4
  %321 = sdiv i32 %319, %320
  %322 = load i32, i32* %m, align 4
  %323 = urem i32 %321, %322
  %324 = icmp eq i32 %318, %323
  %325 = zext i1 %324 to i32
  %326 = icmp eq i32 %313, %325
  br i1 %326, label %339, label %327

; <label>:327                                     ; preds = %305
  %328 = load i32, i32* %idx, align 4
  %329 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 8, i32 %328)
  %330 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %331 = load i32, i32* %m, align 4
  %332 = load i32, i32* %x_u, align 4
  %333 = load i32, i32* %y_u, align 4
  %334 = load i32, i32* %z_u, align 4
  %335 = load i32, i32* %x_s, align 4
  %336 = load i32, i32* %y_s, align 4
  %337 = load i32, i32* %z_s, align 4
  %338 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %331, i32 %332, i32 %333, i32 %334, i32 %335, i32 %336, i32 %337)
  store i32 1, i32* %1
  br label %1491

; <label>:339                                     ; preds = %305, %296, %287, %284, %277
  %340 = load i32, i32* %z_u, align 4
  %341 = zext i32 %340 to i64
  %342 = load i32, i32* %m, align 4
  %343 = zext i32 %342 to i64
  %344 = call i64 @gcd(i64 %341, i64 %343)
  %345 = icmp ne i64 %344, 1
  br i1 %345, label %401, label %346

; <label>:346                                     ; preds = %339
  %347 = load i32, i32* %z_u, align 4
  %348 = icmp eq i32 %347, 0
  br i1 %348, label %401, label %349

; <label>:349                                     ; preds = %346
  %350 = load i32, i32* %x_s, align 4
  %351 = sext i32 %350 to i64
  %352 = load i32, i32* %z_u, align 4
  %353 = zext i32 %352 to i64
  %354 = call i64 @gcd(i64 %351, i64 %353)
  %355 = load i32, i32* %z_u, align 4
  %356 = zext i32 %355 to i64
  %357 = icmp ne i64 %354, %356
  br i1 %357, label %401, label %358

; <label>:358                                     ; preds = %349
  %359 = load i32, i32* %y_s, align 4
  %360 = sext i32 %359 to i64
  %361 = load i32, i32* %z_u, align 4
  %362 = zext i32 %361 to i64
  %363 = call i64 @gcd(i64 %360, i64 %362)
  %364 = load i32, i32* %z_u, align 4
  %365 = zext i32 %364 to i64
  %366 = icmp ne i64 %363, %365
  br i1 %366, label %401, label %367

; <label>:367                                     ; preds = %358
  %368 = load i32, i32* %x_s, align 4
  %369 = load i32, i32* %m, align 4
  %370 = urem i32 %368, %369
  %371 = load i32, i32* %y_s, align 4
  %372 = load i32, i32* %m, align 4
  %373 = urem i32 %371, %372
  %374 = icmp eq i32 %370, %373
  %375 = zext i1 %374 to i32
  %376 = load i32, i32* %x_s, align 4
  %377 = load i32, i32* %z_u, align 4
  %378 = udiv i32 %376, %377
  %379 = load i32, i32* %m, align 4
  %380 = urem i32 %378, %379
  %381 = load i32, i32* %y_s, align 4
  %382 = load i32, i32* %z_u, align 4
  %383 = udiv i32 %381, %382
  %384 = load i32, i32* %m, align 4
  %385 = urem i32 %383, %384
  %386 = icmp eq i32 %380, %385
  %387 = zext i1 %386 to i32
  %388 = icmp eq i32 %375, %387
  br i1 %388, label %401, label %389

; <label>:389                                     ; preds = %367
  %390 = load i32, i32* %idx, align 4
  %391 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 9, i32 %390)
  %392 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %393 = load i32, i32* %m, align 4
  %394 = load i32, i32* %x_u, align 4
  %395 = load i32, i32* %y_u, align 4
  %396 = load i32, i32* %z_u, align 4
  %397 = load i32, i32* %x_s, align 4
  %398 = load i32, i32* %y_s, align 4
  %399 = load i32, i32* %z_s, align 4
  %400 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %393, i32 %394, i32 %395, i32 %396, i32 %397, i32 %398, i32 %399)
  store i32 1, i32* %1
  br label %1491

; <label>:401                                     ; preds = %367, %358, %349, %346, %339
  %402 = load i32, i32* %z_s, align 4
  %403 = sext i32 %402 to i64
  %404 = load i32, i32* %m, align 4
  %405 = zext i32 %404 to i64
  %406 = call i64 @gcd(i64 %403, i64 %405)
  %407 = icmp ne i64 %406, 1
  br i1 %407, label %463, label %408

; <label>:408                                     ; preds = %401
  %409 = load i32, i32* %z_s, align 4
  %410 = icmp eq i32 %409, 0
  br i1 %410, label %463, label %411

; <label>:411                                     ; preds = %408
  %412 = load i32, i32* %x_s, align 4
  %413 = sext i32 %412 to i64
  %414 = load i32, i32* %z_s, align 4
  %415 = sext i32 %414 to i64
  %416 = call i64 @gcd(i64 %413, i64 %415)
  %417 = load i32, i32* %z_s, align 4
  %418 = sext i32 %417 to i64
  %419 = icmp ne i64 %416, %418
  br i1 %419, label %463, label %420

; <label>:420                                     ; preds = %411
  %421 = load i32, i32* %y_u, align 4
  %422 = zext i32 %421 to i64
  %423 = load i32, i32* %z_s, align 4
  %424 = sext i32 %423 to i64
  %425 = call i64 @gcd(i64 %422, i64 %424)
  %426 = load i32, i32* %z_s, align 4
  %427 = sext i32 %426 to i64
  %428 = icmp ne i64 %425, %427
  br i1 %428, label %463, label %429

; <label>:429                                     ; preds = %420
  %430 = load i32, i32* %x_s, align 4
  %431 = load i32, i32* %m, align 4
  %432 = urem i32 %430, %431
  %433 = load i32, i32* %y_u, align 4
  %434 = load i32, i32* %m, align 4
  %435 = urem i32 %433, %434
  %436 = icmp eq i32 %432, %435
  %437 = zext i1 %436 to i32
  %438 = load i32, i32* %x_s, align 4
  %439 = load i32, i32* %z_s, align 4
  %440 = sdiv i32 %438, %439
  %441 = load i32, i32* %m, align 4
  %442 = urem i32 %440, %441
  %443 = load i32, i32* %y_u, align 4
  %444 = load i32, i32* %z_s, align 4
  %445 = udiv i32 %443, %444
  %446 = load i32, i32* %m, align 4
  %447 = urem i32 %445, %446
  %448 = icmp eq i32 %442, %447
  %449 = zext i1 %448 to i32
  %450 = icmp eq i32 %437, %449
  br i1 %450, label %463, label %451

; <label>:451                                     ; preds = %429
  %452 = load i32, i32* %idx, align 4
  %453 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 10, i32 %452)
  %454 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %455 = load i32, i32* %m, align 4
  %456 = load i32, i32* %x_u, align 4
  %457 = load i32, i32* %y_u, align 4
  %458 = load i32, i32* %z_u, align 4
  %459 = load i32, i32* %x_s, align 4
  %460 = load i32, i32* %y_s, align 4
  %461 = load i32, i32* %z_s, align 4
  %462 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %455, i32 %456, i32 %457, i32 %458, i32 %459, i32 %460, i32 %461)
  store i32 1, i32* %1
  br label %1491

; <label>:463                                     ; preds = %429, %420, %411, %408, %401
  %464 = load i32, i32* %z_u, align 4
  %465 = zext i32 %464 to i64
  %466 = load i32, i32* %m, align 4
  %467 = zext i32 %466 to i64
  %468 = call i64 @gcd(i64 %465, i64 %467)
  %469 = icmp ne i64 %468, 1
  br i1 %469, label %525, label %470

; <label>:470                                     ; preds = %463
  %471 = load i32, i32* %z_u, align 4
  %472 = icmp eq i32 %471, 0
  br i1 %472, label %525, label %473

; <label>:473                                     ; preds = %470
  %474 = load i32, i32* %x_s, align 4
  %475 = sext i32 %474 to i64
  %476 = load i32, i32* %z_u, align 4
  %477 = zext i32 %476 to i64
  %478 = call i64 @gcd(i64 %475, i64 %477)
  %479 = load i32, i32* %z_u, align 4
  %480 = zext i32 %479 to i64
  %481 = icmp ne i64 %478, %480
  br i1 %481, label %525, label %482

; <label>:482                                     ; preds = %473
  %483 = load i32, i32* %y_u, align 4
  %484 = zext i32 %483 to i64
  %485 = load i32, i32* %z_u, align 4
  %486 = zext i32 %485 to i64
  %487 = call i64 @gcd(i64 %484, i64 %486)
  %488 = load i32, i32* %z_u, align 4
  %489 = zext i32 %488 to i64
  %490 = icmp ne i64 %487, %489
  br i1 %490, label %525, label %491

; <label>:491                                     ; preds = %482
  %492 = load i32, i32* %x_s, align 4
  %493 = load i32, i32* %m, align 4
  %494 = urem i32 %492, %493
  %495 = load i32, i32* %y_u, align 4
  %496 = load i32, i32* %m, align 4
  %497 = urem i32 %495, %496
  %498 = icmp eq i32 %494, %497
  %499 = zext i1 %498 to i32
  %500 = load i32, i32* %x_s, align 4
  %501 = load i32, i32* %z_u, align 4
  %502 = udiv i32 %500, %501
  %503 = load i32, i32* %m, align 4
  %504 = urem i32 %502, %503
  %505 = load i32, i32* %y_u, align 4
  %506 = load i32, i32* %z_u, align 4
  %507 = udiv i32 %505, %506
  %508 = load i32, i32* %m, align 4
  %509 = urem i32 %507, %508
  %510 = icmp eq i32 %504, %509
  %511 = zext i1 %510 to i32
  %512 = icmp eq i32 %499, %511
  br i1 %512, label %525, label %513

; <label>:513                                     ; preds = %491
  %514 = load i32, i32* %idx, align 4
  %515 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 11, i32 %514)
  %516 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %517 = load i32, i32* %m, align 4
  %518 = load i32, i32* %x_u, align 4
  %519 = load i32, i32* %y_u, align 4
  %520 = load i32, i32* %z_u, align 4
  %521 = load i32, i32* %x_s, align 4
  %522 = load i32, i32* %y_s, align 4
  %523 = load i32, i32* %z_s, align 4
  %524 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %517, i32 %518, i32 %519, i32 %520, i32 %521, i32 %522, i32 %523)
  store i32 1, i32* %1
  br label %1491

; <label>:525                                     ; preds = %491, %482, %473, %470, %463
  %526 = load i32, i32* %z_s, align 4
  %527 = sext i32 %526 to i64
  %528 = load i32, i32* %m, align 4
  %529 = zext i32 %528 to i64
  %530 = call i64 @gcd(i64 %527, i64 %529)
  %531 = icmp ne i64 %530, 1
  br i1 %531, label %587, label %532

; <label>:532                                     ; preds = %525
  %533 = load i32, i32* %z_s, align 4
  %534 = icmp eq i32 %533, 0
  br i1 %534, label %587, label %535

; <label>:535                                     ; preds = %532
  %536 = load i32, i32* %x_u, align 4
  %537 = zext i32 %536 to i64
  %538 = load i32, i32* %z_s, align 4
  %539 = sext i32 %538 to i64
  %540 = call i64 @gcd(i64 %537, i64 %539)
  %541 = load i32, i32* %z_s, align 4
  %542 = sext i32 %541 to i64
  %543 = icmp ne i64 %540, %542
  br i1 %543, label %587, label %544

; <label>:544                                     ; preds = %535
  %545 = load i32, i32* %y_s, align 4
  %546 = sext i32 %545 to i64
  %547 = load i32, i32* %z_s, align 4
  %548 = sext i32 %547 to i64
  %549 = call i64 @gcd(i64 %546, i64 %548)
  %550 = load i32, i32* %z_s, align 4
  %551 = sext i32 %550 to i64
  %552 = icmp ne i64 %549, %551
  br i1 %552, label %587, label %553

; <label>:553                                     ; preds = %544
  %554 = load i32, i32* %x_u, align 4
  %555 = load i32, i32* %m, align 4
  %556 = urem i32 %554, %555
  %557 = load i32, i32* %y_s, align 4
  %558 = load i32, i32* %m, align 4
  %559 = urem i32 %557, %558
  %560 = icmp eq i32 %556, %559
  %561 = zext i1 %560 to i32
  %562 = load i32, i32* %x_u, align 4
  %563 = load i32, i32* %z_s, align 4
  %564 = udiv i32 %562, %563
  %565 = load i32, i32* %m, align 4
  %566 = urem i32 %564, %565
  %567 = load i32, i32* %y_s, align 4
  %568 = load i32, i32* %z_s, align 4
  %569 = sdiv i32 %567, %568
  %570 = load i32, i32* %m, align 4
  %571 = urem i32 %569, %570
  %572 = icmp eq i32 %566, %571
  %573 = zext i1 %572 to i32
  %574 = icmp eq i32 %561, %573
  br i1 %574, label %587, label %575

; <label>:575                                     ; preds = %553
  %576 = load i32, i32* %idx, align 4
  %577 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 12, i32 %576)
  %578 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %579 = load i32, i32* %m, align 4
  %580 = load i32, i32* %x_u, align 4
  %581 = load i32, i32* %y_u, align 4
  %582 = load i32, i32* %z_u, align 4
  %583 = load i32, i32* %x_s, align 4
  %584 = load i32, i32* %y_s, align 4
  %585 = load i32, i32* %z_s, align 4
  %586 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %579, i32 %580, i32 %581, i32 %582, i32 %583, i32 %584, i32 %585)
  store i32 1, i32* %1
  br label %1491

; <label>:587                                     ; preds = %553, %544, %535, %532, %525
  %588 = load i32, i32* %z_u, align 4
  %589 = zext i32 %588 to i64
  %590 = load i32, i32* %m, align 4
  %591 = zext i32 %590 to i64
  %592 = call i64 @gcd(i64 %589, i64 %591)
  %593 = icmp ne i64 %592, 1
  br i1 %593, label %649, label %594

; <label>:594                                     ; preds = %587
  %595 = load i32, i32* %z_u, align 4
  %596 = icmp eq i32 %595, 0
  br i1 %596, label %649, label %597

; <label>:597                                     ; preds = %594
  %598 = load i32, i32* %x_u, align 4
  %599 = zext i32 %598 to i64
  %600 = load i32, i32* %z_u, align 4
  %601 = zext i32 %600 to i64
  %602 = call i64 @gcd(i64 %599, i64 %601)
  %603 = load i32, i32* %z_u, align 4
  %604 = zext i32 %603 to i64
  %605 = icmp ne i64 %602, %604
  br i1 %605, label %649, label %606

; <label>:606                                     ; preds = %597
  %607 = load i32, i32* %y_s, align 4
  %608 = sext i32 %607 to i64
  %609 = load i32, i32* %z_u, align 4
  %610 = zext i32 %609 to i64
  %611 = call i64 @gcd(i64 %608, i64 %610)
  %612 = load i32, i32* %z_u, align 4
  %613 = zext i32 %612 to i64
  %614 = icmp ne i64 %611, %613
  br i1 %614, label %649, label %615

; <label>:615                                     ; preds = %606
  %616 = load i32, i32* %x_u, align 4
  %617 = load i32, i32* %m, align 4
  %618 = urem i32 %616, %617
  %619 = load i32, i32* %y_s, align 4
  %620 = load i32, i32* %m, align 4
  %621 = urem i32 %619, %620
  %622 = icmp eq i32 %618, %621
  %623 = zext i1 %622 to i32
  %624 = load i32, i32* %x_u, align 4
  %625 = load i32, i32* %z_u, align 4
  %626 = udiv i32 %624, %625
  %627 = load i32, i32* %m, align 4
  %628 = urem i32 %626, %627
  %629 = load i32, i32* %y_s, align 4
  %630 = load i32, i32* %z_u, align 4
  %631 = udiv i32 %629, %630
  %632 = load i32, i32* %m, align 4
  %633 = urem i32 %631, %632
  %634 = icmp eq i32 %628, %633
  %635 = zext i1 %634 to i32
  %636 = icmp eq i32 %623, %635
  br i1 %636, label %649, label %637

; <label>:637                                     ; preds = %615
  %638 = load i32, i32* %idx, align 4
  %639 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 13, i32 %638)
  %640 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %641 = load i32, i32* %m, align 4
  %642 = load i32, i32* %x_u, align 4
  %643 = load i32, i32* %y_u, align 4
  %644 = load i32, i32* %z_u, align 4
  %645 = load i32, i32* %x_s, align 4
  %646 = load i32, i32* %y_s, align 4
  %647 = load i32, i32* %z_s, align 4
  %648 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %641, i32 %642, i32 %643, i32 %644, i32 %645, i32 %646, i32 %647)
  store i32 1, i32* %1
  br label %1491

; <label>:649                                     ; preds = %615, %606, %597, %594, %587
  %650 = load i32, i32* %z_s, align 4
  %651 = sext i32 %650 to i64
  %652 = load i32, i32* %m, align 4
  %653 = zext i32 %652 to i64
  %654 = call i64 @gcd(i64 %651, i64 %653)
  %655 = icmp ne i64 %654, 1
  br i1 %655, label %711, label %656

; <label>:656                                     ; preds = %649
  %657 = load i32, i32* %z_s, align 4
  %658 = icmp eq i32 %657, 0
  br i1 %658, label %711, label %659

; <label>:659                                     ; preds = %656
  %660 = load i32, i32* %x_u, align 4
  %661 = zext i32 %660 to i64
  %662 = load i32, i32* %z_s, align 4
  %663 = sext i32 %662 to i64
  %664 = call i64 @gcd(i64 %661, i64 %663)
  %665 = load i32, i32* %z_s, align 4
  %666 = sext i32 %665 to i64
  %667 = icmp ne i64 %664, %666
  br i1 %667, label %711, label %668

; <label>:668                                     ; preds = %659
  %669 = load i32, i32* %y_u, align 4
  %670 = zext i32 %669 to i64
  %671 = load i32, i32* %z_s, align 4
  %672 = sext i32 %671 to i64
  %673 = call i64 @gcd(i64 %670, i64 %672)
  %674 = load i32, i32* %z_s, align 4
  %675 = sext i32 %674 to i64
  %676 = icmp ne i64 %673, %675
  br i1 %676, label %711, label %677

; <label>:677                                     ; preds = %668
  %678 = load i32, i32* %x_u, align 4
  %679 = load i32, i32* %m, align 4
  %680 = urem i32 %678, %679
  %681 = load i32, i32* %y_u, align 4
  %682 = load i32, i32* %m, align 4
  %683 = urem i32 %681, %682
  %684 = icmp eq i32 %680, %683
  %685 = zext i1 %684 to i32
  %686 = load i32, i32* %x_u, align 4
  %687 = load i32, i32* %z_s, align 4
  %688 = udiv i32 %686, %687
  %689 = load i32, i32* %m, align 4
  %690 = urem i32 %688, %689
  %691 = load i32, i32* %y_u, align 4
  %692 = load i32, i32* %z_s, align 4
  %693 = udiv i32 %691, %692
  %694 = load i32, i32* %m, align 4
  %695 = urem i32 %693, %694
  %696 = icmp eq i32 %690, %695
  %697 = zext i1 %696 to i32
  %698 = icmp eq i32 %685, %697
  br i1 %698, label %711, label %699

; <label>:699                                     ; preds = %677
  %700 = load i32, i32* %idx, align 4
  %701 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 14, i32 %700)
  %702 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %703 = load i32, i32* %m, align 4
  %704 = load i32, i32* %x_u, align 4
  %705 = load i32, i32* %y_u, align 4
  %706 = load i32, i32* %z_u, align 4
  %707 = load i32, i32* %x_s, align 4
  %708 = load i32, i32* %y_s, align 4
  %709 = load i32, i32* %z_s, align 4
  %710 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %703, i32 %704, i32 %705, i32 %706, i32 %707, i32 %708, i32 %709)
  store i32 1, i32* %1
  br label %1491

; <label>:711                                     ; preds = %677, %668, %659, %656, %649
  %712 = load i32, i32* %z_u, align 4
  %713 = zext i32 %712 to i64
  %714 = load i32, i32* %m, align 4
  %715 = zext i32 %714 to i64
  %716 = call i64 @gcd(i64 %713, i64 %715)
  %717 = icmp ne i64 %716, 1
  br i1 %717, label %773, label %718

; <label>:718                                     ; preds = %711
  %719 = load i32, i32* %z_u, align 4
  %720 = icmp eq i32 %719, 0
  br i1 %720, label %773, label %721

; <label>:721                                     ; preds = %718
  %722 = load i32, i32* %x_u, align 4
  %723 = zext i32 %722 to i64
  %724 = load i32, i32* %z_u, align 4
  %725 = zext i32 %724 to i64
  %726 = call i64 @gcd(i64 %723, i64 %725)
  %727 = load i32, i32* %z_u, align 4
  %728 = zext i32 %727 to i64
  %729 = icmp ne i64 %726, %728
  br i1 %729, label %773, label %730

; <label>:730                                     ; preds = %721
  %731 = load i32, i32* %y_u, align 4
  %732 = zext i32 %731 to i64
  %733 = load i32, i32* %z_u, align 4
  %734 = zext i32 %733 to i64
  %735 = call i64 @gcd(i64 %732, i64 %734)
  %736 = load i32, i32* %z_u, align 4
  %737 = zext i32 %736 to i64
  %738 = icmp ne i64 %735, %737
  br i1 %738, label %773, label %739

; <label>:739                                     ; preds = %730
  %740 = load i32, i32* %x_u, align 4
  %741 = load i32, i32* %m, align 4
  %742 = urem i32 %740, %741
  %743 = load i32, i32* %y_u, align 4
  %744 = load i32, i32* %m, align 4
  %745 = urem i32 %743, %744
  %746 = icmp eq i32 %742, %745
  %747 = zext i1 %746 to i32
  %748 = load i32, i32* %x_u, align 4
  %749 = load i32, i32* %z_u, align 4
  %750 = udiv i32 %748, %749
  %751 = load i32, i32* %m, align 4
  %752 = urem i32 %750, %751
  %753 = load i32, i32* %y_u, align 4
  %754 = load i32, i32* %z_u, align 4
  %755 = udiv i32 %753, %754
  %756 = load i32, i32* %m, align 4
  %757 = urem i32 %755, %756
  %758 = icmp eq i32 %752, %757
  %759 = zext i1 %758 to i32
  %760 = icmp eq i32 %747, %759
  br i1 %760, label %773, label %761

; <label>:761                                     ; preds = %739
  %762 = load i32, i32* %idx, align 4
  %763 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 15, i32 %762)
  %764 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %765 = load i32, i32* %m, align 4
  %766 = load i32, i32* %x_u, align 4
  %767 = load i32, i32* %y_u, align 4
  %768 = load i32, i32* %z_u, align 4
  %769 = load i32, i32* %x_s, align 4
  %770 = load i32, i32* %y_s, align 4
  %771 = load i32, i32* %z_s, align 4
  %772 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %765, i32 %766, i32 %767, i32 %768, i32 %769, i32 %770, i32 %771)
  store i32 1, i32* %1
  br label %1491

; <label>:773                                     ; preds = %739, %730, %721, %718, %711
  %774 = load i32, i32* %z_s, align 4
  %775 = icmp eq i32 %774, 0
  br i1 %775, label %841, label %776

; <label>:776                                     ; preds = %773
  %777 = load i32, i32* %x_s, align 4
  %778 = sext i32 %777 to i64
  %779 = load i32, i32* %z_s, align 4
  %780 = sext i32 %779 to i64
  %781 = call i64 @gcd(i64 %778, i64 %780)
  %782 = load i32, i32* %z_s, align 4
  %783 = sext i32 %782 to i64
  %784 = icmp ne i64 %781, %783
  br i1 %784, label %841, label %785

; <label>:785                                     ; preds = %776
  %786 = load i32, i32* %y_s, align 4
  %787 = sext i32 %786 to i64
  %788 = load i32, i32* %z_s, align 4
  %789 = sext i32 %788 to i64
  %790 = call i64 @gcd(i64 %787, i64 %789)
  %791 = load i32, i32* %z_s, align 4
  %792 = sext i32 %791 to i64
  %793 = icmp ne i64 %790, %792
  br i1 %793, label %841, label %794

; <label>:794                                     ; preds = %785
  %795 = load i32, i32* %m, align 4
  %796 = zext i32 %795 to i64
  %797 = load i32, i32* %z_s, align 4
  %798 = sext i32 %797 to i64
  %799 = call i64 @gcd(i64 %796, i64 %798)
  %800 = load i32, i32* %z_s, align 4
  %801 = sext i32 %800 to i64
  %802 = icmp ne i64 %799, %801
  br i1 %802, label %841, label %803

; <label>:803                                     ; preds = %794
  %804 = load i32, i32* %x_s, align 4
  %805 = load i32, i32* %m, align 4
  %806 = urem i32 %804, %805
  %807 = load i32, i32* %y_s, align 4
  %808 = load i32, i32* %m, align 4
  %809 = urem i32 %807, %808
  %810 = icmp eq i32 %806, %809
  %811 = zext i1 %810 to i32
  %812 = load i32, i32* %x_s, align 4
  %813 = load i32, i32* %z_s, align 4
  %814 = sdiv i32 %812, %813
  %815 = load i32, i32* %m, align 4
  %816 = load i32, i32* %z_s, align 4
  %817 = udiv i32 %815, %816
  %818 = urem i32 %814, %817
  %819 = load i32, i32* %y_s, align 4
  %820 = load i32, i32* %z_s, align 4
  %821 = sdiv i32 %819, %820
  %822 = load i32, i32* %m, align 4
  %823 = load i32, i32* %z_s, align 4
  %824 = udiv i32 %822, %823
  %825 = urem i32 %821, %824
  %826 = icmp eq i32 %818, %825
  %827 = zext i1 %826 to i32
  %828 = icmp eq i32 %811, %827
  br i1 %828, label %841, label %829

; <label>:829                                     ; preds = %803
  %830 = load i32, i32* %idx, align 4
  %831 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 16, i32 %830)
  %832 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %833 = load i32, i32* %m, align 4
  %834 = load i32, i32* %x_u, align 4
  %835 = load i32, i32* %y_u, align 4
  %836 = load i32, i32* %z_u, align 4
  %837 = load i32, i32* %x_s, align 4
  %838 = load i32, i32* %y_s, align 4
  %839 = load i32, i32* %z_s, align 4
  %840 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %833, i32 %834, i32 %835, i32 %836, i32 %837, i32 %838, i32 %839)
  store i32 1, i32* %1
  br label %1491

; <label>:841                                     ; preds = %803, %794, %785, %776, %773
  %842 = load i32, i32* %z_u, align 4
  %843 = icmp eq i32 %842, 0
  br i1 %843, label %909, label %844

; <label>:844                                     ; preds = %841
  %845 = load i32, i32* %x_s, align 4
  %846 = sext i32 %845 to i64
  %847 = load i32, i32* %z_u, align 4
  %848 = zext i32 %847 to i64
  %849 = call i64 @gcd(i64 %846, i64 %848)
  %850 = load i32, i32* %z_u, align 4
  %851 = zext i32 %850 to i64
  %852 = icmp ne i64 %849, %851
  br i1 %852, label %909, label %853

; <label>:853                                     ; preds = %844
  %854 = load i32, i32* %y_s, align 4
  %855 = sext i32 %854 to i64
  %856 = load i32, i32* %z_u, align 4
  %857 = zext i32 %856 to i64
  %858 = call i64 @gcd(i64 %855, i64 %857)
  %859 = load i32, i32* %z_u, align 4
  %860 = zext i32 %859 to i64
  %861 = icmp ne i64 %858, %860
  br i1 %861, label %909, label %862

; <label>:862                                     ; preds = %853
  %863 = load i32, i32* %m, align 4
  %864 = zext i32 %863 to i64
  %865 = load i32, i32* %z_u, align 4
  %866 = zext i32 %865 to i64
  %867 = call i64 @gcd(i64 %864, i64 %866)
  %868 = load i32, i32* %z_u, align 4
  %869 = zext i32 %868 to i64
  %870 = icmp ne i64 %867, %869
  br i1 %870, label %909, label %871

; <label>:871                                     ; preds = %862
  %872 = load i32, i32* %x_s, align 4
  %873 = load i32, i32* %m, align 4
  %874 = urem i32 %872, %873
  %875 = load i32, i32* %y_s, align 4
  %876 = load i32, i32* %m, align 4
  %877 = urem i32 %875, %876
  %878 = icmp eq i32 %874, %877
  %879 = zext i1 %878 to i32
  %880 = load i32, i32* %x_s, align 4
  %881 = load i32, i32* %z_u, align 4
  %882 = udiv i32 %880, %881
  %883 = load i32, i32* %m, align 4
  %884 = load i32, i32* %z_u, align 4
  %885 = udiv i32 %883, %884
  %886 = urem i32 %882, %885
  %887 = load i32, i32* %y_s, align 4
  %888 = load i32, i32* %z_u, align 4
  %889 = udiv i32 %887, %888
  %890 = load i32, i32* %m, align 4
  %891 = load i32, i32* %z_u, align 4
  %892 = udiv i32 %890, %891
  %893 = urem i32 %889, %892
  %894 = icmp eq i32 %886, %893
  %895 = zext i1 %894 to i32
  %896 = icmp eq i32 %879, %895
  br i1 %896, label %909, label %897

; <label>:897                                     ; preds = %871
  %898 = load i32, i32* %idx, align 4
  %899 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 17, i32 %898)
  %900 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %901 = load i32, i32* %m, align 4
  %902 = load i32, i32* %x_u, align 4
  %903 = load i32, i32* %y_u, align 4
  %904 = load i32, i32* %z_u, align 4
  %905 = load i32, i32* %x_s, align 4
  %906 = load i32, i32* %y_s, align 4
  %907 = load i32, i32* %z_s, align 4
  %908 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %901, i32 %902, i32 %903, i32 %904, i32 %905, i32 %906, i32 %907)
  store i32 1, i32* %1
  br label %1491

; <label>:909                                     ; preds = %871, %862, %853, %844, %841
  %910 = load i32, i32* %z_s, align 4
  %911 = icmp eq i32 %910, 0
  br i1 %911, label %977, label %912

; <label>:912                                     ; preds = %909
  %913 = load i32, i32* %x_s, align 4
  %914 = sext i32 %913 to i64
  %915 = load i32, i32* %z_s, align 4
  %916 = sext i32 %915 to i64
  %917 = call i64 @gcd(i64 %914, i64 %916)
  %918 = load i32, i32* %z_s, align 4
  %919 = sext i32 %918 to i64
  %920 = icmp ne i64 %917, %919
  br i1 %920, label %977, label %921

; <label>:921                                     ; preds = %912
  %922 = load i32, i32* %y_u, align 4
  %923 = zext i32 %922 to i64
  %924 = load i32, i32* %z_s, align 4
  %925 = sext i32 %924 to i64
  %926 = call i64 @gcd(i64 %923, i64 %925)
  %927 = load i32, i32* %z_s, align 4
  %928 = sext i32 %927 to i64
  %929 = icmp ne i64 %926, %928
  br i1 %929, label %977, label %930

; <label>:930                                     ; preds = %921
  %931 = load i32, i32* %m, align 4
  %932 = zext i32 %931 to i64
  %933 = load i32, i32* %z_s, align 4
  %934 = sext i32 %933 to i64
  %935 = call i64 @gcd(i64 %932, i64 %934)
  %936 = load i32, i32* %z_s, align 4
  %937 = sext i32 %936 to i64
  %938 = icmp ne i64 %935, %937
  br i1 %938, label %977, label %939

; <label>:939                                     ; preds = %930
  %940 = load i32, i32* %x_s, align 4
  %941 = load i32, i32* %m, align 4
  %942 = urem i32 %940, %941
  %943 = load i32, i32* %y_u, align 4
  %944 = load i32, i32* %m, align 4
  %945 = urem i32 %943, %944
  %946 = icmp eq i32 %942, %945
  %947 = zext i1 %946 to i32
  %948 = load i32, i32* %x_s, align 4
  %949 = load i32, i32* %z_s, align 4
  %950 = sdiv i32 %948, %949
  %951 = load i32, i32* %m, align 4
  %952 = load i32, i32* %z_s, align 4
  %953 = udiv i32 %951, %952
  %954 = urem i32 %950, %953
  %955 = load i32, i32* %y_u, align 4
  %956 = load i32, i32* %z_s, align 4
  %957 = udiv i32 %955, %956
  %958 = load i32, i32* %m, align 4
  %959 = load i32, i32* %z_s, align 4
  %960 = udiv i32 %958, %959
  %961 = urem i32 %957, %960
  %962 = icmp eq i32 %954, %961
  %963 = zext i1 %962 to i32
  %964 = icmp eq i32 %947, %963
  br i1 %964, label %977, label %965

; <label>:965                                     ; preds = %939
  %966 = load i32, i32* %idx, align 4
  %967 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 18, i32 %966)
  %968 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %969 = load i32, i32* %m, align 4
  %970 = load i32, i32* %x_u, align 4
  %971 = load i32, i32* %y_u, align 4
  %972 = load i32, i32* %z_u, align 4
  %973 = load i32, i32* %x_s, align 4
  %974 = load i32, i32* %y_s, align 4
  %975 = load i32, i32* %z_s, align 4
  %976 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %969, i32 %970, i32 %971, i32 %972, i32 %973, i32 %974, i32 %975)
  store i32 1, i32* %1
  br label %1491

; <label>:977                                     ; preds = %939, %930, %921, %912, %909
  %978 = load i32, i32* %z_u, align 4
  %979 = icmp eq i32 %978, 0
  br i1 %979, label %1045, label %980

; <label>:980                                     ; preds = %977
  %981 = load i32, i32* %x_s, align 4
  %982 = sext i32 %981 to i64
  %983 = load i32, i32* %z_u, align 4
  %984 = zext i32 %983 to i64
  %985 = call i64 @gcd(i64 %982, i64 %984)
  %986 = load i32, i32* %z_u, align 4
  %987 = zext i32 %986 to i64
  %988 = icmp ne i64 %985, %987
  br i1 %988, label %1045, label %989

; <label>:989                                     ; preds = %980
  %990 = load i32, i32* %y_u, align 4
  %991 = zext i32 %990 to i64
  %992 = load i32, i32* %z_u, align 4
  %993 = zext i32 %992 to i64
  %994 = call i64 @gcd(i64 %991, i64 %993)
  %995 = load i32, i32* %z_u, align 4
  %996 = zext i32 %995 to i64
  %997 = icmp ne i64 %994, %996
  br i1 %997, label %1045, label %998

; <label>:998                                     ; preds = %989
  %999 = load i32, i32* %m, align 4
  %1000 = zext i32 %999 to i64
  %1001 = load i32, i32* %z_u, align 4
  %1002 = zext i32 %1001 to i64
  %1003 = call i64 @gcd(i64 %1000, i64 %1002)
  %1004 = load i32, i32* %z_u, align 4
  %1005 = zext i32 %1004 to i64
  %1006 = icmp ne i64 %1003, %1005
  br i1 %1006, label %1045, label %1007

; <label>:1007                                    ; preds = %998
  %1008 = load i32, i32* %x_s, align 4
  %1009 = load i32, i32* %m, align 4
  %1010 = urem i32 %1008, %1009
  %1011 = load i32, i32* %y_u, align 4
  %1012 = load i32, i32* %m, align 4
  %1013 = urem i32 %1011, %1012
  %1014 = icmp eq i32 %1010, %1013
  %1015 = zext i1 %1014 to i32
  %1016 = load i32, i32* %x_s, align 4
  %1017 = load i32, i32* %z_u, align 4
  %1018 = udiv i32 %1016, %1017
  %1019 = load i32, i32* %m, align 4
  %1020 = load i32, i32* %z_u, align 4
  %1021 = udiv i32 %1019, %1020
  %1022 = urem i32 %1018, %1021
  %1023 = load i32, i32* %y_u, align 4
  %1024 = load i32, i32* %z_u, align 4
  %1025 = udiv i32 %1023, %1024
  %1026 = load i32, i32* %m, align 4
  %1027 = load i32, i32* %z_u, align 4
  %1028 = udiv i32 %1026, %1027
  %1029 = urem i32 %1025, %1028
  %1030 = icmp eq i32 %1022, %1029
  %1031 = zext i1 %1030 to i32
  %1032 = icmp eq i32 %1015, %1031
  br i1 %1032, label %1045, label %1033

; <label>:1033                                    ; preds = %1007
  %1034 = load i32, i32* %idx, align 4
  %1035 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 19, i32 %1034)
  %1036 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %1037 = load i32, i32* %m, align 4
  %1038 = load i32, i32* %x_u, align 4
  %1039 = load i32, i32* %y_u, align 4
  %1040 = load i32, i32* %z_u, align 4
  %1041 = load i32, i32* %x_s, align 4
  %1042 = load i32, i32* %y_s, align 4
  %1043 = load i32, i32* %z_s, align 4
  %1044 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %1037, i32 %1038, i32 %1039, i32 %1040, i32 %1041, i32 %1042, i32 %1043)
  store i32 1, i32* %1
  br label %1491

; <label>:1045                                    ; preds = %1007, %998, %989, %980, %977
  %1046 = load i32, i32* %z_s, align 4
  %1047 = icmp eq i32 %1046, 0
  br i1 %1047, label %1113, label %1048

; <label>:1048                                    ; preds = %1045
  %1049 = load i32, i32* %x_u, align 4
  %1050 = zext i32 %1049 to i64
  %1051 = load i32, i32* %z_s, align 4
  %1052 = sext i32 %1051 to i64
  %1053 = call i64 @gcd(i64 %1050, i64 %1052)
  %1054 = load i32, i32* %z_s, align 4
  %1055 = sext i32 %1054 to i64
  %1056 = icmp ne i64 %1053, %1055
  br i1 %1056, label %1113, label %1057

; <label>:1057                                    ; preds = %1048
  %1058 = load i32, i32* %y_s, align 4
  %1059 = sext i32 %1058 to i64
  %1060 = load i32, i32* %z_s, align 4
  %1061 = sext i32 %1060 to i64
  %1062 = call i64 @gcd(i64 %1059, i64 %1061)
  %1063 = load i32, i32* %z_s, align 4
  %1064 = sext i32 %1063 to i64
  %1065 = icmp ne i64 %1062, %1064
  br i1 %1065, label %1113, label %1066

; <label>:1066                                    ; preds = %1057
  %1067 = load i32, i32* %m, align 4
  %1068 = zext i32 %1067 to i64
  %1069 = load i32, i32* %z_s, align 4
  %1070 = sext i32 %1069 to i64
  %1071 = call i64 @gcd(i64 %1068, i64 %1070)
  %1072 = load i32, i32* %z_s, align 4
  %1073 = sext i32 %1072 to i64
  %1074 = icmp ne i64 %1071, %1073
  br i1 %1074, label %1113, label %1075

; <label>:1075                                    ; preds = %1066
  %1076 = load i32, i32* %x_u, align 4
  %1077 = load i32, i32* %m, align 4
  %1078 = urem i32 %1076, %1077
  %1079 = load i32, i32* %y_s, align 4
  %1080 = load i32, i32* %m, align 4
  %1081 = urem i32 %1079, %1080
  %1082 = icmp eq i32 %1078, %1081
  %1083 = zext i1 %1082 to i32
  %1084 = load i32, i32* %x_u, align 4
  %1085 = load i32, i32* %z_s, align 4
  %1086 = udiv i32 %1084, %1085
  %1087 = load i32, i32* %m, align 4
  %1088 = load i32, i32* %z_s, align 4
  %1089 = udiv i32 %1087, %1088
  %1090 = urem i32 %1086, %1089
  %1091 = load i32, i32* %y_s, align 4
  %1092 = load i32, i32* %z_s, align 4
  %1093 = sdiv i32 %1091, %1092
  %1094 = load i32, i32* %m, align 4
  %1095 = load i32, i32* %z_s, align 4
  %1096 = udiv i32 %1094, %1095
  %1097 = urem i32 %1093, %1096
  %1098 = icmp eq i32 %1090, %1097
  %1099 = zext i1 %1098 to i32
  %1100 = icmp eq i32 %1083, %1099
  br i1 %1100, label %1113, label %1101

; <label>:1101                                    ; preds = %1075
  %1102 = load i32, i32* %idx, align 4
  %1103 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 20, i32 %1102)
  %1104 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %1105 = load i32, i32* %m, align 4
  %1106 = load i32, i32* %x_u, align 4
  %1107 = load i32, i32* %y_u, align 4
  %1108 = load i32, i32* %z_u, align 4
  %1109 = load i32, i32* %x_s, align 4
  %1110 = load i32, i32* %y_s, align 4
  %1111 = load i32, i32* %z_s, align 4
  %1112 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %1105, i32 %1106, i32 %1107, i32 %1108, i32 %1109, i32 %1110, i32 %1111)
  store i32 1, i32* %1
  br label %1491

; <label>:1113                                    ; preds = %1075, %1066, %1057, %1048, %1045
  %1114 = load i32, i32* %z_u, align 4
  %1115 = icmp eq i32 %1114, 0
  br i1 %1115, label %1181, label %1116

; <label>:1116                                    ; preds = %1113
  %1117 = load i32, i32* %x_u, align 4
  %1118 = zext i32 %1117 to i64
  %1119 = load i32, i32* %z_u, align 4
  %1120 = zext i32 %1119 to i64
  %1121 = call i64 @gcd(i64 %1118, i64 %1120)
  %1122 = load i32, i32* %z_u, align 4
  %1123 = zext i32 %1122 to i64
  %1124 = icmp ne i64 %1121, %1123
  br i1 %1124, label %1181, label %1125

; <label>:1125                                    ; preds = %1116
  %1126 = load i32, i32* %y_s, align 4
  %1127 = sext i32 %1126 to i64
  %1128 = load i32, i32* %z_u, align 4
  %1129 = zext i32 %1128 to i64
  %1130 = call i64 @gcd(i64 %1127, i64 %1129)
  %1131 = load i32, i32* %z_u, align 4
  %1132 = zext i32 %1131 to i64
  %1133 = icmp ne i64 %1130, %1132
  br i1 %1133, label %1181, label %1134

; <label>:1134                                    ; preds = %1125
  %1135 = load i32, i32* %m, align 4
  %1136 = zext i32 %1135 to i64
  %1137 = load i32, i32* %z_u, align 4
  %1138 = zext i32 %1137 to i64
  %1139 = call i64 @gcd(i64 %1136, i64 %1138)
  %1140 = load i32, i32* %z_u, align 4
  %1141 = zext i32 %1140 to i64
  %1142 = icmp ne i64 %1139, %1141
  br i1 %1142, label %1181, label %1143

; <label>:1143                                    ; preds = %1134
  %1144 = load i32, i32* %x_u, align 4
  %1145 = load i32, i32* %m, align 4
  %1146 = urem i32 %1144, %1145
  %1147 = load i32, i32* %y_s, align 4
  %1148 = load i32, i32* %m, align 4
  %1149 = urem i32 %1147, %1148
  %1150 = icmp eq i32 %1146, %1149
  %1151 = zext i1 %1150 to i32
  %1152 = load i32, i32* %x_u, align 4
  %1153 = load i32, i32* %z_u, align 4
  %1154 = udiv i32 %1152, %1153
  %1155 = load i32, i32* %m, align 4
  %1156 = load i32, i32* %z_u, align 4
  %1157 = udiv i32 %1155, %1156
  %1158 = urem i32 %1154, %1157
  %1159 = load i32, i32* %y_s, align 4
  %1160 = load i32, i32* %z_u, align 4
  %1161 = udiv i32 %1159, %1160
  %1162 = load i32, i32* %m, align 4
  %1163 = load i32, i32* %z_u, align 4
  %1164 = udiv i32 %1162, %1163
  %1165 = urem i32 %1161, %1164
  %1166 = icmp eq i32 %1158, %1165
  %1167 = zext i1 %1166 to i32
  %1168 = icmp eq i32 %1151, %1167
  br i1 %1168, label %1181, label %1169

; <label>:1169                                    ; preds = %1143
  %1170 = load i32, i32* %idx, align 4
  %1171 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 21, i32 %1170)
  %1172 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %1173 = load i32, i32* %m, align 4
  %1174 = load i32, i32* %x_u, align 4
  %1175 = load i32, i32* %y_u, align 4
  %1176 = load i32, i32* %z_u, align 4
  %1177 = load i32, i32* %x_s, align 4
  %1178 = load i32, i32* %y_s, align 4
  %1179 = load i32, i32* %z_s, align 4
  %1180 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %1173, i32 %1174, i32 %1175, i32 %1176, i32 %1177, i32 %1178, i32 %1179)
  store i32 1, i32* %1
  br label %1491

; <label>:1181                                    ; preds = %1143, %1134, %1125, %1116, %1113
  %1182 = load i32, i32* %z_s, align 4
  %1183 = icmp eq i32 %1182, 0
  br i1 %1183, label %1249, label %1184

; <label>:1184                                    ; preds = %1181
  %1185 = load i32, i32* %x_u, align 4
  %1186 = zext i32 %1185 to i64
  %1187 = load i32, i32* %z_s, align 4
  %1188 = sext i32 %1187 to i64
  %1189 = call i64 @gcd(i64 %1186, i64 %1188)
  %1190 = load i32, i32* %z_s, align 4
  %1191 = sext i32 %1190 to i64
  %1192 = icmp ne i64 %1189, %1191
  br i1 %1192, label %1249, label %1193

; <label>:1193                                    ; preds = %1184
  %1194 = load i32, i32* %y_u, align 4
  %1195 = zext i32 %1194 to i64
  %1196 = load i32, i32* %z_s, align 4
  %1197 = sext i32 %1196 to i64
  %1198 = call i64 @gcd(i64 %1195, i64 %1197)
  %1199 = load i32, i32* %z_s, align 4
  %1200 = sext i32 %1199 to i64
  %1201 = icmp ne i64 %1198, %1200
  br i1 %1201, label %1249, label %1202

; <label>:1202                                    ; preds = %1193
  %1203 = load i32, i32* %m, align 4
  %1204 = zext i32 %1203 to i64
  %1205 = load i32, i32* %z_s, align 4
  %1206 = sext i32 %1205 to i64
  %1207 = call i64 @gcd(i64 %1204, i64 %1206)
  %1208 = load i32, i32* %z_s, align 4
  %1209 = sext i32 %1208 to i64
  %1210 = icmp ne i64 %1207, %1209
  br i1 %1210, label %1249, label %1211

; <label>:1211                                    ; preds = %1202
  %1212 = load i32, i32* %x_u, align 4
  %1213 = load i32, i32* %m, align 4
  %1214 = urem i32 %1212, %1213
  %1215 = load i32, i32* %y_u, align 4
  %1216 = load i32, i32* %m, align 4
  %1217 = urem i32 %1215, %1216
  %1218 = icmp eq i32 %1214, %1217
  %1219 = zext i1 %1218 to i32
  %1220 = load i32, i32* %x_u, align 4
  %1221 = load i32, i32* %z_s, align 4
  %1222 = udiv i32 %1220, %1221
  %1223 = load i32, i32* %m, align 4
  %1224 = load i32, i32* %z_s, align 4
  %1225 = udiv i32 %1223, %1224
  %1226 = urem i32 %1222, %1225
  %1227 = load i32, i32* %y_u, align 4
  %1228 = load i32, i32* %z_s, align 4
  %1229 = udiv i32 %1227, %1228
  %1230 = load i32, i32* %m, align 4
  %1231 = load i32, i32* %z_s, align 4
  %1232 = udiv i32 %1230, %1231
  %1233 = urem i32 %1229, %1232
  %1234 = icmp eq i32 %1226, %1233
  %1235 = zext i1 %1234 to i32
  %1236 = icmp eq i32 %1219, %1235
  br i1 %1236, label %1249, label %1237

; <label>:1237                                    ; preds = %1211
  %1238 = load i32, i32* %idx, align 4
  %1239 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 22, i32 %1238)
  %1240 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %1241 = load i32, i32* %m, align 4
  %1242 = load i32, i32* %x_u, align 4
  %1243 = load i32, i32* %y_u, align 4
  %1244 = load i32, i32* %z_u, align 4
  %1245 = load i32, i32* %x_s, align 4
  %1246 = load i32, i32* %y_s, align 4
  %1247 = load i32, i32* %z_s, align 4
  %1248 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %1241, i32 %1242, i32 %1243, i32 %1244, i32 %1245, i32 %1246, i32 %1247)
  store i32 1, i32* %1
  br label %1491

; <label>:1249                                    ; preds = %1211, %1202, %1193, %1184, %1181
  %1250 = load i32, i32* %z_u, align 4
  %1251 = icmp eq i32 %1250, 0
  br i1 %1251, label %1317, label %1252

; <label>:1252                                    ; preds = %1249
  %1253 = load i32, i32* %x_u, align 4
  %1254 = zext i32 %1253 to i64
  %1255 = load i32, i32* %z_u, align 4
  %1256 = zext i32 %1255 to i64
  %1257 = call i64 @gcd(i64 %1254, i64 %1256)
  %1258 = load i32, i32* %z_u, align 4
  %1259 = zext i32 %1258 to i64
  %1260 = icmp ne i64 %1257, %1259
  br i1 %1260, label %1317, label %1261

; <label>:1261                                    ; preds = %1252
  %1262 = load i32, i32* %y_u, align 4
  %1263 = zext i32 %1262 to i64
  %1264 = load i32, i32* %z_u, align 4
  %1265 = zext i32 %1264 to i64
  %1266 = call i64 @gcd(i64 %1263, i64 %1265)
  %1267 = load i32, i32* %z_u, align 4
  %1268 = zext i32 %1267 to i64
  %1269 = icmp ne i64 %1266, %1268
  br i1 %1269, label %1317, label %1270

; <label>:1270                                    ; preds = %1261
  %1271 = load i32, i32* %m, align 4
  %1272 = zext i32 %1271 to i64
  %1273 = load i32, i32* %z_u, align 4
  %1274 = zext i32 %1273 to i64
  %1275 = call i64 @gcd(i64 %1272, i64 %1274)
  %1276 = load i32, i32* %z_u, align 4
  %1277 = zext i32 %1276 to i64
  %1278 = icmp ne i64 %1275, %1277
  br i1 %1278, label %1317, label %1279

; <label>:1279                                    ; preds = %1270
  %1280 = load i32, i32* %x_u, align 4
  %1281 = load i32, i32* %m, align 4
  %1282 = urem i32 %1280, %1281
  %1283 = load i32, i32* %y_u, align 4
  %1284 = load i32, i32* %m, align 4
  %1285 = urem i32 %1283, %1284
  %1286 = icmp eq i32 %1282, %1285
  %1287 = zext i1 %1286 to i32
  %1288 = load i32, i32* %x_u, align 4
  %1289 = load i32, i32* %z_u, align 4
  %1290 = udiv i32 %1288, %1289
  %1291 = load i32, i32* %m, align 4
  %1292 = load i32, i32* %z_u, align 4
  %1293 = udiv i32 %1291, %1292
  %1294 = urem i32 %1290, %1293
  %1295 = load i32, i32* %y_u, align 4
  %1296 = load i32, i32* %z_u, align 4
  %1297 = udiv i32 %1295, %1296
  %1298 = load i32, i32* %m, align 4
  %1299 = load i32, i32* %z_u, align 4
  %1300 = udiv i32 %1298, %1299
  %1301 = urem i32 %1297, %1300
  %1302 = icmp eq i32 %1294, %1301
  %1303 = zext i1 %1302 to i32
  %1304 = icmp eq i32 %1287, %1303
  br i1 %1304, label %1317, label %1305

; <label>:1305                                    ; preds = %1279
  %1306 = load i32, i32* %idx, align 4
  %1307 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 23, i32 %1306)
  %1308 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %1309 = load i32, i32* %m, align 4
  %1310 = load i32, i32* %x_u, align 4
  %1311 = load i32, i32* %y_u, align 4
  %1312 = load i32, i32* %z_u, align 4
  %1313 = load i32, i32* %x_s, align 4
  %1314 = load i32, i32* %y_s, align 4
  %1315 = load i32, i32* %z_s, align 4
  %1316 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %1309, i32 %1310, i32 %1311, i32 %1312, i32 %1313, i32 %1314, i32 %1315)
  store i32 1, i32* %1
  br label %1491

; <label>:1317                                    ; preds = %1279, %1270, %1261, %1252, %1249
  %1318 = load i32, i32* %z_u, align 4
  %1319 = icmp eq i32 %1318, 0
  br i1 %1319, label %1359, label %1320

; <label>:1320                                    ; preds = %1317
  %1321 = load i32, i32* %m, align 4
  %1322 = zext i32 %1321 to i64
  %1323 = load i32, i32* %z_u, align 4
  %1324 = zext i32 %1323 to i64
  %1325 = call i64 @gcd(i64 %1322, i64 %1324)
  %1326 = load i32, i32* %z_u, align 4
  %1327 = zext i32 %1326 to i64
  %1328 = icmp ne i64 %1325, %1327
  br i1 %1328, label %1359, label %1329

; <label>:1329                                    ; preds = %1320
  %1330 = load i32, i32* %x_s, align 4
  %1331 = load i32, i32* %m, align 4
  %1332 = urem i32 %1330, %1331
  %1333 = load i32, i32* %y_s, align 4
  %1334 = load i32, i32* %m, align 4
  %1335 = urem i32 %1333, %1334
  %1336 = icmp eq i32 %1332, %1335
  %1337 = zext i1 %1336 to i32
  %1338 = load i32, i32* %x_s, align 4
  %1339 = load i32, i32* %z_u, align 4
  %1340 = urem i32 %1338, %1339
  %1341 = load i32, i32* %y_s, align 4
  %1342 = load i32, i32* %z_u, align 4
  %1343 = urem i32 %1341, %1342
  %1344 = icmp eq i32 %1340, %1343
  %1345 = zext i1 %1344 to i32
  %1346 = icmp eq i32 %1337, %1345
  br i1 %1346, label %1359, label %1347

; <label>:1347                                    ; preds = %1329
  %1348 = load i32, i32* %idx, align 4
  %1349 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 25, i32 %1348)
  %1350 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %1351 = load i32, i32* %m, align 4
  %1352 = load i32, i32* %x_u, align 4
  %1353 = load i32, i32* %y_u, align 4
  %1354 = load i32, i32* %z_u, align 4
  %1355 = load i32, i32* %x_s, align 4
  %1356 = load i32, i32* %y_s, align 4
  %1357 = load i32, i32* %z_s, align 4
  %1358 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %1351, i32 %1352, i32 %1353, i32 %1354, i32 %1355, i32 %1356, i32 %1357)
  store i32 1, i32* %1
  br label %1491

; <label>:1359                                    ; preds = %1329, %1320, %1317
  %1360 = load i32, i32* %z_u, align 4
  %1361 = icmp eq i32 %1360, 0
  br i1 %1361, label %1401, label %1362

; <label>:1362                                    ; preds = %1359
  %1363 = load i32, i32* %m, align 4
  %1364 = zext i32 %1363 to i64
  %1365 = load i32, i32* %z_u, align 4
  %1366 = zext i32 %1365 to i64
  %1367 = call i64 @gcd(i64 %1364, i64 %1366)
  %1368 = load i32, i32* %z_u, align 4
  %1369 = zext i32 %1368 to i64
  %1370 = icmp ne i64 %1367, %1369
  br i1 %1370, label %1401, label %1371

; <label>:1371                                    ; preds = %1362
  %1372 = load i32, i32* %x_s, align 4
  %1373 = load i32, i32* %m, align 4
  %1374 = urem i32 %1372, %1373
  %1375 = load i32, i32* %y_u, align 4
  %1376 = load i32, i32* %m, align 4
  %1377 = urem i32 %1375, %1376
  %1378 = icmp eq i32 %1374, %1377
  %1379 = zext i1 %1378 to i32
  %1380 = load i32, i32* %x_s, align 4
  %1381 = load i32, i32* %z_u, align 4
  %1382 = urem i32 %1380, %1381
  %1383 = load i32, i32* %y_u, align 4
  %1384 = load i32, i32* %z_u, align 4
  %1385 = urem i32 %1383, %1384
  %1386 = icmp eq i32 %1382, %1385
  %1387 = zext i1 %1386 to i32
  %1388 = icmp eq i32 %1379, %1387
  br i1 %1388, label %1401, label %1389

; <label>:1389                                    ; preds = %1371
  %1390 = load i32, i32* %idx, align 4
  %1391 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 27, i32 %1390)
  %1392 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %1393 = load i32, i32* %m, align 4
  %1394 = load i32, i32* %x_u, align 4
  %1395 = load i32, i32* %y_u, align 4
  %1396 = load i32, i32* %z_u, align 4
  %1397 = load i32, i32* %x_s, align 4
  %1398 = load i32, i32* %y_s, align 4
  %1399 = load i32, i32* %z_s, align 4
  %1400 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %1393, i32 %1394, i32 %1395, i32 %1396, i32 %1397, i32 %1398, i32 %1399)
  store i32 1, i32* %1
  br label %1491

; <label>:1401                                    ; preds = %1371, %1362, %1359
  %1402 = load i32, i32* %z_u, align 4
  %1403 = icmp eq i32 %1402, 0
  br i1 %1403, label %1443, label %1404

; <label>:1404                                    ; preds = %1401
  %1405 = load i32, i32* %m, align 4
  %1406 = zext i32 %1405 to i64
  %1407 = load i32, i32* %z_u, align 4
  %1408 = zext i32 %1407 to i64
  %1409 = call i64 @gcd(i64 %1406, i64 %1408)
  %1410 = load i32, i32* %z_u, align 4
  %1411 = zext i32 %1410 to i64
  %1412 = icmp ne i64 %1409, %1411
  br i1 %1412, label %1443, label %1413

; <label>:1413                                    ; preds = %1404
  %1414 = load i32, i32* %x_u, align 4
  %1415 = load i32, i32* %m, align 4
  %1416 = urem i32 %1414, %1415
  %1417 = load i32, i32* %y_s, align 4
  %1418 = load i32, i32* %m, align 4
  %1419 = urem i32 %1417, %1418
  %1420 = icmp eq i32 %1416, %1419
  %1421 = zext i1 %1420 to i32
  %1422 = load i32, i32* %x_u, align 4
  %1423 = load i32, i32* %z_u, align 4
  %1424 = urem i32 %1422, %1423
  %1425 = load i32, i32* %y_s, align 4
  %1426 = load i32, i32* %z_u, align 4
  %1427 = urem i32 %1425, %1426
  %1428 = icmp eq i32 %1424, %1427
  %1429 = zext i1 %1428 to i32
  %1430 = icmp eq i32 %1421, %1429
  br i1 %1430, label %1443, label %1431

; <label>:1431                                    ; preds = %1413
  %1432 = load i32, i32* %idx, align 4
  %1433 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 29, i32 %1432)
  %1434 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %1435 = load i32, i32* %m, align 4
  %1436 = load i32, i32* %x_u, align 4
  %1437 = load i32, i32* %y_u, align 4
  %1438 = load i32, i32* %z_u, align 4
  %1439 = load i32, i32* %x_s, align 4
  %1440 = load i32, i32* %y_s, align 4
  %1441 = load i32, i32* %z_s, align 4
  %1442 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %1435, i32 %1436, i32 %1437, i32 %1438, i32 %1439, i32 %1440, i32 %1441)
  store i32 1, i32* %1
  br label %1491

; <label>:1443                                    ; preds = %1413, %1404, %1401
  %1444 = load i32, i32* %z_u, align 4
  %1445 = icmp eq i32 %1444, 0
  br i1 %1445, label %1485, label %1446

; <label>:1446                                    ; preds = %1443
  %1447 = load i32, i32* %m, align 4
  %1448 = zext i32 %1447 to i64
  %1449 = load i32, i32* %z_u, align 4
  %1450 = zext i32 %1449 to i64
  %1451 = call i64 @gcd(i64 %1448, i64 %1450)
  %1452 = load i32, i32* %z_u, align 4
  %1453 = zext i32 %1452 to i64
  %1454 = icmp ne i64 %1451, %1453
  br i1 %1454, label %1485, label %1455

; <label>:1455                                    ; preds = %1446
  %1456 = load i32, i32* %x_u, align 4
  %1457 = load i32, i32* %m, align 4
  %1458 = urem i32 %1456, %1457
  %1459 = load i32, i32* %y_u, align 4
  %1460 = load i32, i32* %m, align 4
  %1461 = urem i32 %1459, %1460
  %1462 = icmp eq i32 %1458, %1461
  %1463 = zext i1 %1462 to i32
  %1464 = load i32, i32* %x_u, align 4
  %1465 = load i32, i32* %z_u, align 4
  %1466 = urem i32 %1464, %1465
  %1467 = load i32, i32* %y_u, align 4
  %1468 = load i32, i32* %z_u, align 4
  %1469 = urem i32 %1467, %1468
  %1470 = icmp eq i32 %1466, %1469
  %1471 = zext i1 %1470 to i32
  %1472 = icmp eq i32 %1463, %1471
  br i1 %1472, label %1485, label %1473

; <label>:1473                                    ; preds = %1455
  %1474 = load i32, i32* %idx, align 4
  %1475 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 31, i32 %1474)
  %1476 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  %1477 = load i32, i32* %m, align 4
  %1478 = load i32, i32* %x_u, align 4
  %1479 = load i32, i32* %y_u, align 4
  %1480 = load i32, i32* %z_u, align 4
  %1481 = load i32, i32* %x_s, align 4
  %1482 = load i32, i32* %y_s, align 4
  %1483 = load i32, i32* %z_s, align 4
  %1484 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0), i32 %1477, i32 %1478, i32 %1479, i32 %1480, i32 %1481, i32 %1482, i32 %1483)
  store i32 1, i32* %1
  br label %1491

; <label>:1485                                    ; preds = %1455, %1446, %1443
  br label %1486

; <label>:1486                                    ; preds = %1485, %11
  %1487 = load i32, i32* %idx, align 4
  %1488 = add i32 %1487, 1
  store i32 %1488, i32* %idx, align 4
  br label %4

; <label>:1489                                    ; preds = %4
  %1490 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %1
  br label %1491

; <label>:1491                                    ; preds = %1489, %1473, %1431, %1389, %1347, %1305, %1237, %1169, %1101, %1033, %965, %897, %829, %761, %699, %637, %575, %513, %451, %389, %327, %265, %225, %177, %131, %107, %83, %59
  %1492 = load i32, i32* %1
  ret i32 %1492
}

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
