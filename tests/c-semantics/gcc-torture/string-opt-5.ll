; ModuleID = './string-opt-5.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = global i32 6, align 4
@y = global i32 1, align 4
@.str = private unnamed_addr constant [9 x i8] c"hi world\00", align 1
@bar = global i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), align 8
@.str1 = private unnamed_addr constant [12 x i8] c"hello world\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"lo world\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"ello world\00", align 1
@.str4 = private unnamed_addr constant [6 x i8] c"ello \00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"foo\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c" oo\00\00\00\00\00\00\00\00 \00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str8 = private unnamed_addr constant [10 x i8] c"hello\00\00\00 \00", align 1
@buf = common global [64 x i8] zeroinitializer, align 16
@.str9 = private unnamed_addr constant [4 x i8] c"!!!\00", align 1
@.str10 = private unnamed_addr constant [12 x i8] c"!!!--------\00", align 1
@.str11 = private unnamed_addr constant [7 x i8] c"---\00\00\00\00", align 1
@.str12 = private unnamed_addr constant [11 x i8] c"-\00\00\00\00\00\00\00\00\00\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %foo = alloca i8*, align 8
  %dst = alloca [64 x i8], align 16
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i8** %foo, align 8
  %2 = load i8** @bar, align 8
  %3 = call i64 @strlen(i8* %2)
  %4 = icmp ne i64 %3, 8
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:6                                       ; preds = %0
  %7 = load i8** @bar, align 8
  %8 = load i32* @x, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @x, align 4
  %10 = and i32 %9, 2
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i8* %7, i64 %11
  %13 = call i64 @strlen(i8* %12)
  %14 = icmp ne i64 %13, 6
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %6
  call void @abort() #4
  unreachable

; <label>:16                                      ; preds = %6
  %17 = load i32* @x, align 4
  %18 = icmp ne i32 %17, 7
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  call void @abort() #4
  unreachable

; <label>:20                                      ; preds = %16
  %21 = load i8** %foo, align 8
  %22 = load i32* @x, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* @x, align 4
  %24 = getelementptr inbounds i8* %21, i64 6
  %25 = call i64 @strlen(i8* %24)
  %26 = icmp ne i64 %25, 5
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %20
  call void @abort() #4
  unreachable

; <label>:28                                      ; preds = %20
  %29 = load i32* @x, align 4
  %30 = icmp ne i32 %29, 8
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %28
  call void @abort() #4
  unreachable

; <label>:32                                      ; preds = %28
  %33 = load i8** %foo, align 8
  %34 = load i32* @x, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* @x, align 4
  %36 = and i32 %35, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8* %33, i64 %37
  %39 = call i64 @strlen(i8* %38)
  %40 = icmp ne i64 %39, 10
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %32
  call void @abort() #4
  unreachable

; <label>:42                                      ; preds = %32
  %43 = load i32* @x, align 4
  %44 = icmp ne i32 %43, 9
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %42
  call void @abort() #4
  unreachable

; <label>:46                                      ; preds = %42
  %47 = load i8** %foo, align 8
  %48 = load i32* @x, align 4
  %49 = sub nsw i32 %48, 6
  store i32 %49, i32* @x, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8* %47, i64 %50
  %52 = call i32 @strcmp(i8* %51, i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %46
  call void @abort() #4
  unreachable

; <label>:55                                      ; preds = %46
  %56 = load i32* @x, align 4
  %57 = icmp ne i32 %56, 3
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %55
  call void @abort() #4
  unreachable

; <label>:59                                      ; preds = %55
  %60 = load i8** %foo, align 8
  %61 = load i8** @bar, align 8
  %62 = call i32 @strcmp(i8* %60, i8* %61)
  %63 = icmp sge i32 %62, 0
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %59
  call void @abort() #4
  unreachable

; <label>:65                                      ; preds = %59
  %66 = load i8** %foo, align 8
  %67 = load i8** @bar, align 8
  %68 = load i32* @x, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* @x, align 4
  %70 = and i32 %68, 1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8* %67, i64 %71
  %73 = call i32 @strcmp(i8* %66, i8* %72)
  %74 = icmp sge i32 %73, 0
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %65
  call void @abort() #4
  unreachable

; <label>:76                                      ; preds = %65
  %77 = load i32* @x, align 4
  %78 = icmp ne i32 %77, 4
  br i1 %78, label %79, label %80

; <label>:79                                      ; preds = %76
  call void @abort() #4
  unreachable

; <label>:80                                      ; preds = %76
  %81 = load i8** %foo, align 8
  %82 = load i32* @x, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* @x, align 4
  %84 = and i32 %82, 7
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8* %81, i64 %85
  %87 = call i8* @strchr(i8* %86, i32 108)
  %88 = load i8** %foo, align 8
  %89 = getelementptr inbounds i8* %88, i64 9
  %90 = icmp ne i8* %87, %89
  br i1 %90, label %91, label %92

; <label>:91                                      ; preds = %80
  call void @abort() #4
  unreachable

; <label>:92                                      ; preds = %80
  %93 = load i32* @x, align 4
  %94 = icmp ne i32 %93, 5
  br i1 %94, label %95, label %96

; <label>:95                                      ; preds = %92
  call void @abort() #4
  unreachable

; <label>:96                                      ; preds = %92
  %97 = load i8** @bar, align 8
  %98 = call i8* @strchr(i8* %97, i32 111)
  %99 = load i8** @bar, align 8
  %100 = getelementptr inbounds i8* %99, i64 4
  %101 = icmp ne i8* %98, %100
  br i1 %101, label %102, label %103

; <label>:102                                     ; preds = %96
  call void @abort() #4
  unreachable

; <label>:103                                     ; preds = %96
  %104 = load i8** @bar, align 8
  %105 = call i8* @strchr(i8* %104, i32 0)
  %106 = load i8** @bar, align 8
  %107 = getelementptr inbounds i8* %106, i64 8
  %108 = icmp ne i8* %105, %107
  br i1 %108, label %109, label %110

; <label>:109                                     ; preds = %103
  call void @abort() #4
  unreachable

; <label>:110                                     ; preds = %103
  %111 = load i8** @bar, align 8
  %112 = call i8* @strrchr(i8* %111, i32 120)
  %113 = icmp ne i8* %112, null
  br i1 %113, label %114, label %115

; <label>:114                                     ; preds = %110
  call void @abort() #4
  unreachable

; <label>:115                                     ; preds = %110
  %116 = load i8** @bar, align 8
  %117 = call i8* @strrchr(i8* %116, i32 111)
  %118 = load i8** @bar, align 8
  %119 = getelementptr inbounds i8* %118, i64 4
  %120 = icmp ne i8* %117, %119
  br i1 %120, label %121, label %122

; <label>:121                                     ; preds = %115
  call void @abort() #4
  unreachable

; <label>:122                                     ; preds = %115
  %123 = load i8** %foo, align 8
  %124 = load i32* @x, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* @x, align 4
  %126 = and i32 %124, 1
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i8* %123, i64 %127
  %129 = load i32* @y, align 4
  %130 = add nsw i32 %129, -1
  store i32 %130, i32* @y, align 4
  %131 = and i32 %130, 1
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i64 %132
  %134 = call i32 @strcmp(i8* %128, i8* %133)
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %136, label %137

; <label>:136                                     ; preds = %122
  call void @abort() #4
  unreachable

; <label>:137                                     ; preds = %122
  %138 = load i32* @x, align 4
  %139 = icmp ne i32 %138, 6
  br i1 %139, label %143, label %140

; <label>:140                                     ; preds = %137
  %141 = load i32* @y, align 4
  %142 = icmp ne i32 %141, 0
  br i1 %142, label %143, label %144

; <label>:143                                     ; preds = %140, %137
  call void @abort() #4
  unreachable

; <label>:144                                     ; preds = %140
  %145 = getelementptr inbounds [64 x i8]* %dst, i32 0, i64 5
  store i8 32, i8* %145, align 1
  %146 = getelementptr inbounds [64 x i8]* %dst, i32 0, i64 6
  store i8 0, i8* %146, align 1
  store i32 5, i32* @x, align 4
  store i32 1, i32* @y, align 4
  %147 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %148 = getelementptr inbounds i8* %147, i64 1
  %149 = load i8** %foo, align 8
  %150 = load i32* @x, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* @x, align 4
  %152 = and i32 %150, 3
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i8* %149, i64 %153
  %155 = call i8* @strncpy(i8* %148, i8* %154, i64 4)
  %156 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %157 = getelementptr inbounds i8* %156, i64 1
  %158 = icmp ne i8* %155, %157
  br i1 %158, label %167, label %159

; <label>:159                                     ; preds = %144
  %160 = load i32* @x, align 4
  %161 = icmp ne i32 %160, 6
  br i1 %161, label %167, label %162

; <label>:162                                     ; preds = %159
  %163 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %164 = getelementptr inbounds i8* %163, i64 1
  %165 = call i32 @strcmp(i8* %164, i8* getelementptr inbounds ([6 x i8]* @.str4, i32 0, i32 0))
  %166 = icmp ne i32 %165, 0
  br i1 %166, label %167, label %168

; <label>:167                                     ; preds = %162, %159, %144
  call void @abort() #4
  unreachable

; <label>:168                                     ; preds = %162
  %169 = bitcast [64 x i8]* %dst to i8*
  call void @llvm.memset.p0i8.i64(i8* %169, i8 32, i64 64, i32 16, i1 false)
  %170 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %171 = load i32* @x, align 4
  %172 = add nsw i32 %171, 1
  store i32 %172, i32* @x, align 4
  %173 = and i32 %172, 1
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i8* %170, i64 %174
  %176 = load i32* @y, align 4
  %177 = add nsw i32 %176, 1
  store i32 %177, i32* @y, align 4
  %178 = and i32 %176, 3
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i64 %179
  %181 = call i8* @strncpy(i8* %175, i8* %180, i64 10)
  %182 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %183 = getelementptr inbounds i8* %182, i64 1
  %184 = icmp ne i8* %181, %183
  br i1 %184, label %195, label %185

; <label>:185                                     ; preds = %168
  %186 = load i32* @x, align 4
  %187 = icmp ne i32 %186, 7
  br i1 %187, label %195, label %188

; <label>:188                                     ; preds = %185
  %189 = load i32* @y, align 4
  %190 = icmp ne i32 %189, 2
  br i1 %190, label %195, label %191

; <label>:191                                     ; preds = %188
  %192 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %193 = call i32 @memcmp(i8* %192, i8* getelementptr inbounds ([13 x i8]* @.str6, i32 0, i32 0), i64 12)
  %194 = icmp ne i32 %193, 0
  br i1 %194, label %195, label %196

; <label>:195                                     ; preds = %191, %188, %185, %168
  call void @abort() #4
  unreachable

; <label>:196                                     ; preds = %191
  %197 = bitcast [64 x i8]* %dst to i8*
  call void @llvm.memset.p0i8.i64(i8* %197, i8 32, i64 64, i32 16, i1 false)
  %198 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %199 = call i8* @strncpy(i8* %198, i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0), i64 8)
  %200 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %201 = icmp ne i8* %199, %200
  br i1 %201, label %206, label %202

; <label>:202                                     ; preds = %196
  %203 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %204 = call i32 @memcmp(i8* %203, i8* getelementptr inbounds ([10 x i8]* @.str8, i32 0, i32 0), i64 9)
  %205 = icmp ne i32 %204, 0
  br i1 %205, label %206, label %207

; <label>:206                                     ; preds = %202, %196
  call void @abort() #4
  unreachable

; <label>:207                                     ; preds = %202
  store i32 33, i32* @x, align 4
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8 32, i64 64, i32 16, i1 false)
  %208 = load i32* @x, align 4
  %209 = add nsw i32 %208, 1
  store i32 %209, i32* @x, align 4
  %210 = trunc i32 %208 to i8
  %211 = load i32* @y, align 4
  %212 = add nsw i32 %211, 1
  store i32 %212, i32* @y, align 4
  %213 = sext i32 %212 to i64
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8 %210, i64 %213, i32 16, i1 false)
  br i1 false, label %223, label %214

; <label>:214                                     ; preds = %207
  %215 = load i32* @x, align 4
  %216 = icmp ne i32 %215, 34
  br i1 %216, label %223, label %217

; <label>:217                                     ; preds = %214
  %218 = load i32* @y, align 4
  %219 = icmp ne i32 %218, 3
  br i1 %219, label %223, label %220

; <label>:220                                     ; preds = %217
  %221 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i64 3)
  %222 = icmp ne i32 %221, 0
  br i1 %222, label %223, label %224

; <label>:223                                     ; preds = %220, %217, %214, %207
  call void @abort() #4
  unreachable

; <label>:224                                     ; preds = %220
  %225 = load i32* @y, align 4
  %226 = add nsw i32 %225, 1
  store i32 %226, i32* @y, align 4
  %227 = sext i32 %225 to i64
  %228 = getelementptr inbounds i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i64 %227
  call void @llvm.memset.p0i8.i64(i8* %228, i8 45, i64 8, i32 1, i1 false)
  %229 = icmp ne i8* %228, getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 3)
  br i1 %229, label %236, label %230

; <label>:230                                     ; preds = %224
  %231 = load i32* @y, align 4
  %232 = icmp ne i32 %231, 4
  br i1 %232, label %236, label %233

; <label>:233                                     ; preds = %230
  %234 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str10, i32 0, i32 0), i64 11)
  %235 = icmp ne i32 %234, 0
  br i1 %235, label %236, label %237

; <label>:236                                     ; preds = %233, %230, %224
  call void @abort() #4
  unreachable

; <label>:237                                     ; preds = %233
  store i32 10, i32* @x, align 4
  %238 = load i32* @x, align 4
  %239 = add nsw i32 %238, 1
  store i32 %239, i32* @x, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i64 %240
  %242 = load i32* @y, align 4
  %243 = add nsw i32 %242, 1
  store i32 %243, i32* @y, align 4
  %244 = sext i32 %242 to i64
  call void @llvm.memset.p0i8.i64(i8* %241, i8 0, i64 %244, i32 1, i1 false)
  %245 = icmp ne i8* %241, getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 11)
  br i1 %245, label %255, label %246

; <label>:246                                     ; preds = %237
  %247 = load i32* @x, align 4
  %248 = icmp ne i32 %247, 11
  br i1 %248, label %255, label %249

; <label>:249                                     ; preds = %246
  %250 = load i32* @y, align 4
  %251 = icmp ne i32 %250, 5
  br i1 %251, label %255, label %252

; <label>:252                                     ; preds = %249
  %253 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 8), i8* getelementptr inbounds ([7 x i8]* @.str11, i32 0, i32 0), i64 7)
  %254 = icmp ne i32 %253, 0
  br i1 %254, label %255, label %256

; <label>:255                                     ; preds = %252, %249, %246, %237
  call void @abort() #4
  unreachable

; <label>:256                                     ; preds = %252
  %257 = load i32* @x, align 4
  %258 = add nsw i32 %257, 4
  store i32 %258, i32* @x, align 4
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i64 %259
  call void @llvm.memset.p0i8.i64(i8* %260, i8 0, i64 6, i32 1, i1 false)
  %261 = icmp ne i8* %260, getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 15)
  br i1 %261, label %268, label %262

; <label>:262                                     ; preds = %256
  %263 = load i32* @x, align 4
  %264 = icmp ne i32 %263, 15
  br i1 %264, label %268, label %265

; <label>:265                                     ; preds = %262
  %266 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 10), i8* getelementptr inbounds ([11 x i8]* @.str12, i32 0, i32 0), i64 11)
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %268, label %269

; <label>:268                                     ; preds = %265, %262, %256
  call void @abort() #4
  unreachable

; <label>:269                                     ; preds = %265
  ret i32 0
}

declare i64 @strlen(i8*) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

declare i32 @strcmp(i8*, i8*) #1

declare i8* @strchr(i8*, i32) #1

declare i8* @strrchr(i8*, i32) #1

declare i8* @strncpy(i8*, i8*, i64) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

declare i32 @memcmp(i8*, i8*, i64) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
