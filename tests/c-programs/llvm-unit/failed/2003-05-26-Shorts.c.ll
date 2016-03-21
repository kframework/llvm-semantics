; ModuleID = './2003-05-26-Shorts.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [42 x i8] c"   ui = %u (0x%x)\09\09UL-ui = %lld (0x%llx)\0A\00", align 1
@.str.1 = private unnamed_addr constant [44 x i8] c"ui*ui = %u (0x%x)\09  UL/ui = %lld (0x%llx)\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [39 x i8] c"    i = %d (0x%x)\09L-i = %lld (0x%llx)\0A\00", align 1
@.str.3 = private unnamed_addr constant [41 x i8] c" i* i = %d (0x%x)\09L/ i = %lld (0x%llx)\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [42 x i8] c"us    = %u (0x%x)\09\09UL-us = %lld (0x%llx)\0A\00", align 1
@.str.5 = private unnamed_addr constant [44 x i8] c"us*us = %u (0x%x)\09  UL/us = %lld (0x%llx)\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [39 x i8] c" s    = %d (0x%x)\09L-s = %lld (0x%llx)\0A\00", align 1
@.str.7 = private unnamed_addr constant [41 x i8] c" s* s = %d (0x%x)\09L/ s = %lld (0x%llx)\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [42 x i8] c"ub    = %u (0x%x)\09\09UL-ub = %lld (0x%llx)\0A\00", align 1
@.str.9 = private unnamed_addr constant [43 x i8] c"ub*ub = %u (0x%x)\09\09UL/ub = %lld (0x%llx)\0A\0A\00", align 1
@.str.10 = private unnamed_addr constant [40 x i8] c" b    = %d (0x%x)\09\09L-b = %lld (0x%llx)\0A\00", align 1
@.str.11 = private unnamed_addr constant [42 x i8] c" b* b = %d (0x%x)\09\09\09L/b = %lld (0x%llx)\0A\0A\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.13 = private unnamed_addr constant [41 x i8] c"uiprod = %u (0x%x)\09  uidiv = %u (0x%x)\0A\0A\00", align 1
@.str.14 = private unnamed_addr constant [41 x i8] c"usprod = %u (0x%x)\09  usdiv = %u (0x%x)\0A\0A\00", align 1
@.str.15 = private unnamed_addr constant [41 x i8] c"ubprod = %u (0x%x)\09  ubdiv = %u (0x%x)\0A\0A\00", align 1
@.str.16 = private unnamed_addr constant [41 x i8] c" iprod = %u (0x%x)\09   idiv = %u (0x%x)\0A\0A\00", align 1
@.str.17 = private unnamed_addr constant [41 x i8] c" sprod = %u (0x%x)\09   sdiv = %u (0x%x)\0A\0A\00", align 1
@.str.18 = private unnamed_addr constant [41 x i8] c" bprod = %u (0x%x)\09   bdiv = %u (0x%x)\0A\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @getL() #0 {
  ret i64 -5787213826675591005
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %UL = alloca i64, align 8
  %L = alloca i64, align 8
  %ui = alloca i32, align 4
  %i = alloca i32, align 4
  %us = alloca i16, align 2
  %s = alloca i16, align 2
  %ub = alloca i8, align 1
  %b = alloca i8, align 1
  %uiprod = alloca i32, align 4
  %usprod = alloca i16, align 2
  %ubprod = alloca i8, align 1
  %iprod = alloca i32, align 4
  %sprod = alloca i16, align 2
  %bprod = alloca i8, align 1
  %uidiv = alloca i32, align 4
  %usdiv = alloca i16, align 2
  %ubdiv = alloca i8, align 1
  %idiv = alloca i32, align 4
  %sdiv = alloca i16, align 2
  %bdiv = alloca i8, align 1
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @getL()
  store i64 %4, i64* %UL, align 8
  %5 = load i64, i64* %UL, align 8
  store i64 %5, i64* %L, align 8
  %6 = load i64, i64* %UL, align 8
  %7 = trunc i64 %6 to i32
  store i32 %7, i32* %ui, align 4
  %8 = load i64, i64* %UL, align 8
  %9 = trunc i64 %8 to i32
  store i32 %9, i32* %i, align 4
  %10 = load i64, i64* %UL, align 8
  %11 = trunc i64 %10 to i16
  store i16 %11, i16* %us, align 2
  %12 = load i64, i64* %UL, align 8
  %13 = trunc i64 %12 to i16
  store i16 %13, i16* %s, align 2
  %14 = load i64, i64* %UL, align 8
  %15 = trunc i64 %14 to i8
  store i8 %15, i8* %ub, align 1
  %16 = load i64, i64* %UL, align 8
  %17 = trunc i64 %16 to i8
  store i8 %17, i8* %b, align 1
  %18 = load i32, i32* %ui, align 4
  %19 = load i32, i32* %ui, align 4
  %20 = load i64, i64* %UL, align 8
  %21 = load i32, i32* %ui, align 4
  %22 = zext i32 %21 to i64
  %23 = sub i64 %20, %22
  %24 = load i64, i64* %UL, align 8
  %25 = load i32, i32* %ui, align 4
  %26 = zext i32 %25 to i64
  %27 = sub i64 %24, %26
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i32 %18, i32 %19, i64 %23, i64 %27)
  %29 = load i32, i32* %ui, align 4
  %30 = load i32, i32* %ui, align 4
  %31 = mul i32 %29, %30
  %32 = load i32, i32* %ui, align 4
  %33 = load i32, i32* %ui, align 4
  %34 = mul i32 %32, %33
  %35 = load i64, i64* %UL, align 8
  %36 = load i32, i32* %ui, align 4
  %37 = zext i32 %36 to i64
  %38 = udiv i64 %35, %37
  %39 = load i64, i64* %UL, align 8
  %40 = load i32, i32* %ui, align 4
  %41 = zext i32 %40 to i64
  %42 = udiv i64 %39, %41
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i32 0, i32 0), i32 %31, i32 %34, i64 %38, i64 %42)
  %44 = load i32, i32* %i, align 4
  %45 = load i32, i32* %i, align 4
  %46 = load i64, i64* %L, align 8
  %47 = load i32, i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = sub nsw i64 %46, %48
  %50 = load i64, i64* %L, align 8
  %51 = load i32, i32* %i, align 4
  %52 = sext i32 %51 to i64
  %53 = sub nsw i64 %50, %52
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.2, i32 0, i32 0), i32 %44, i32 %45, i64 %49, i64 %53)
  %55 = load i32, i32* %i, align 4
  %56 = load i32, i32* %i, align 4
  %57 = mul nsw i32 %55, %56
  %58 = load i32, i32* %i, align 4
  %59 = load i32, i32* %i, align 4
  %60 = mul nsw i32 %58, %59
  %61 = load i64, i64* %L, align 8
  %62 = load i32, i32* %i, align 4
  %63 = sext i32 %62 to i64
  %64 = sdiv i64 %61, %63
  %65 = load i64, i64* %L, align 8
  %66 = load i32, i32* %i, align 4
  %67 = sext i32 %66 to i64
  %68 = sdiv i64 %65, %67
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.3, i32 0, i32 0), i32 %57, i32 %60, i64 %64, i64 %68)
  %70 = load i16, i16* %us, align 2
  %71 = zext i16 %70 to i32
  %72 = load i16, i16* %us, align 2
  %73 = zext i16 %72 to i32
  %74 = load i64, i64* %UL, align 8
  %75 = load i16, i16* %us, align 2
  %76 = zext i16 %75 to i64
  %77 = sub i64 %74, %76
  %78 = load i64, i64* %UL, align 8
  %79 = load i16, i16* %us, align 2
  %80 = zext i16 %79 to i64
  %81 = sub i64 %78, %80
  %82 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.4, i32 0, i32 0), i32 %71, i32 %73, i64 %77, i64 %81)
  %83 = load i16, i16* %us, align 2
  %84 = zext i16 %83 to i32
  %85 = load i16, i16* %us, align 2
  %86 = zext i16 %85 to i32
  %87 = mul nsw i32 %84, %86
  %88 = load i16, i16* %us, align 2
  %89 = zext i16 %88 to i32
  %90 = load i16, i16* %us, align 2
  %91 = zext i16 %90 to i32
  %92 = mul nsw i32 %89, %91
  %93 = load i64, i64* %UL, align 8
  %94 = load i16, i16* %us, align 2
  %95 = zext i16 %94 to i64
  %96 = udiv i64 %93, %95
  %97 = load i64, i64* %UL, align 8
  %98 = load i16, i16* %us, align 2
  %99 = zext i16 %98 to i64
  %100 = udiv i64 %97, %99
  %101 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.5, i32 0, i32 0), i32 %87, i32 %92, i64 %96, i64 %100)
  %102 = load i16, i16* %s, align 2
  %103 = sext i16 %102 to i32
  %104 = load i16, i16* %s, align 2
  %105 = sext i16 %104 to i32
  %106 = load i64, i64* %L, align 8
  %107 = load i16, i16* %s, align 2
  %108 = sext i16 %107 to i64
  %109 = sub nsw i64 %106, %108
  %110 = load i64, i64* %L, align 8
  %111 = load i16, i16* %s, align 2
  %112 = sext i16 %111 to i64
  %113 = sub nsw i64 %110, %112
  %114 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.6, i32 0, i32 0), i32 %103, i32 %105, i64 %109, i64 %113)
  %115 = load i16, i16* %s, align 2
  %116 = sext i16 %115 to i32
  %117 = load i16, i16* %s, align 2
  %118 = sext i16 %117 to i32
  %119 = mul nsw i32 %116, %118
  %120 = load i16, i16* %s, align 2
  %121 = sext i16 %120 to i32
  %122 = load i16, i16* %s, align 2
  %123 = sext i16 %122 to i32
  %124 = mul nsw i32 %121, %123
  %125 = load i64, i64* %L, align 8
  %126 = load i16, i16* %s, align 2
  %127 = sext i16 %126 to i64
  %128 = sdiv i64 %125, %127
  %129 = load i64, i64* %L, align 8
  %130 = load i16, i16* %s, align 2
  %131 = sext i16 %130 to i64
  %132 = sdiv i64 %129, %131
  %133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7, i32 0, i32 0), i32 %119, i32 %124, i64 %128, i64 %132)
  %134 = load i8, i8* %ub, align 1
  %135 = zext i8 %134 to i32
  %136 = load i8, i8* %ub, align 1
  %137 = zext i8 %136 to i32
  %138 = load i64, i64* %UL, align 8
  %139 = load i8, i8* %ub, align 1
  %140 = zext i8 %139 to i64
  %141 = sub i64 %138, %140
  %142 = load i64, i64* %UL, align 8
  %143 = load i8, i8* %ub, align 1
  %144 = zext i8 %143 to i64
  %145 = sub i64 %142, %144
  %146 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.8, i32 0, i32 0), i32 %135, i32 %137, i64 %141, i64 %145)
  %147 = load i8, i8* %ub, align 1
  %148 = zext i8 %147 to i32
  %149 = load i8, i8* %ub, align 1
  %150 = zext i8 %149 to i32
  %151 = mul nsw i32 %148, %150
  %152 = load i8, i8* %ub, align 1
  %153 = zext i8 %152 to i32
  %154 = load i8, i8* %ub, align 1
  %155 = zext i8 %154 to i32
  %156 = mul nsw i32 %153, %155
  %157 = load i64, i64* %UL, align 8
  %158 = load i8, i8* %ub, align 1
  %159 = zext i8 %158 to i64
  %160 = udiv i64 %157, %159
  %161 = load i64, i64* %UL, align 8
  %162 = load i8, i8* %ub, align 1
  %163 = zext i8 %162 to i64
  %164 = udiv i64 %161, %163
  %165 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.9, i32 0, i32 0), i32 %151, i32 %156, i64 %160, i64 %164)
  %166 = load i8, i8* %b, align 1
  %167 = sext i8 %166 to i32
  %168 = load i8, i8* %b, align 1
  %169 = sext i8 %168 to i32
  %170 = load i64, i64* %L, align 8
  %171 = load i8, i8* %b, align 1
  %172 = sext i8 %171 to i64
  %173 = sub nsw i64 %170, %172
  %174 = load i64, i64* %L, align 8
  %175 = load i8, i8* %b, align 1
  %176 = sext i8 %175 to i64
  %177 = sub nsw i64 %174, %176
  %178 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.10, i32 0, i32 0), i32 %167, i32 %169, i64 %173, i64 %177)
  %179 = load i8, i8* %b, align 1
  %180 = sext i8 %179 to i32
  %181 = load i8, i8* %b, align 1
  %182 = sext i8 %181 to i32
  %183 = mul nsw i32 %180, %182
  %184 = load i8, i8* %b, align 1
  %185 = sext i8 %184 to i32
  %186 = load i8, i8* %b, align 1
  %187 = sext i8 %186 to i32
  %188 = mul nsw i32 %185, %187
  %189 = load i64, i64* %L, align 8
  %190 = load i8, i8* %b, align 1
  %191 = sext i8 %190 to i64
  %192 = sdiv i64 %189, %191
  %193 = load i64, i64* %L, align 8
  %194 = load i8, i8* %b, align 1
  %195 = sext i8 %194 to i64
  %196 = sdiv i64 %193, %195
  %197 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.11, i32 0, i32 0), i32 %183, i32 %188, i64 %192, i64 %196)
  %198 = load i32, i32* %ui, align 4
  %199 = add i32 %198, 1
  %200 = load i32, i32* %ui, align 4
  %201 = add i32 %200, 1
  %202 = mul i32 %199, %201
  %203 = load i32, i32* %ui, align 4
  %204 = shl i32 %203, 2
  %205 = sub i32 %202, %204
  %206 = sub i32 %205, 1
  store i32 %206, i32* %uiprod, align 4
  %207 = load i16, i16* %us, align 2
  %208 = zext i16 %207 to i32
  %209 = add i32 %208, 1
  %210 = load i16, i16* %us, align 2
  %211 = zext i16 %210 to i32
  %212 = add i32 %211, 1
  %213 = mul i32 %209, %212
  %214 = load i16, i16* %us, align 2
  %215 = zext i16 %214 to i32
  %216 = shl i32 %215, 2
  %217 = trunc i32 %216 to i16
  %218 = zext i16 %217 to i32
  %219 = sub i32 %213, %218
  %220 = sub i32 %219, 1
  %221 = trunc i32 %220 to i16
  store i16 %221, i16* %usprod, align 2
  %222 = load i8, i8* %ub, align 1
  %223 = zext i8 %222 to i32
  %224 = add i32 %223, 1
  %225 = load i8, i8* %ub, align 1
  %226 = zext i8 %225 to i32
  %227 = add i32 %226, 1
  %228 = mul i32 %224, %227
  %229 = load i8, i8* %ub, align 1
  %230 = zext i8 %229 to i32
  %231 = shl i32 %230, 2
  %232 = trunc i32 %231 to i8
  %233 = zext i8 %232 to i32
  %234 = sub i32 %228, %233
  %235 = sub i32 %234, 1
  %236 = trunc i32 %235 to i8
  store i8 %236, i8* %ubprod, align 1
  %237 = load i32, i32* %i, align 4
  %238 = add nsw i32 %237, 1
  %239 = load i32, i32* %i, align 4
  %240 = add nsw i32 %239, 1
  %241 = mul nsw i32 %238, %240
  %242 = load i32, i32* %i, align 4
  %243 = shl i32 %242, 2
  %244 = sub nsw i32 %241, %243
  %245 = sub nsw i32 %244, 1
  store i32 %245, i32* %iprod, align 4
  %246 = load i16, i16* %s, align 2
  %247 = sext i16 %246 to i32
  %248 = add nsw i32 %247, 1
  %249 = load i16, i16* %s, align 2
  %250 = sext i16 %249 to i32
  %251 = add nsw i32 %250, 1
  %252 = mul nsw i32 %248, %251
  %253 = load i16, i16* %s, align 2
  %254 = sext i16 %253 to i32
  %255 = shl i32 %254, 2
  %256 = trunc i32 %255 to i16
  %257 = sext i16 %256 to i32
  %258 = sub nsw i32 %252, %257
  %259 = sub nsw i32 %258, 1
  %260 = trunc i32 %259 to i16
  store i16 %260, i16* %sprod, align 2
  %261 = load i8, i8* %b, align 1
  %262 = sext i8 %261 to i32
  %263 = add nsw i32 %262, 1
  %264 = load i8, i8* %b, align 1
  %265 = sext i8 %264 to i32
  %266 = add nsw i32 %265, 1
  %267 = mul nsw i32 %263, %266
  %268 = load i8, i8* %b, align 1
  %269 = sext i8 %268 to i32
  %270 = shl i32 %269, 2
  %271 = trunc i32 %270 to i8
  %272 = sext i8 %271 to i32
  %273 = sub nsw i32 %267, %272
  %274 = sub nsw i32 %273, 1
  %275 = trunc i32 %274 to i8
  store i8 %275, i8* %bprod, align 1
  %276 = load i64, i64* %UL, align 8
  %277 = load i32, i32* %ui, align 4
  %278 = zext i32 %277 to i64
  %279 = udiv i64 %276, %278
  %280 = trunc i64 %279 to i32
  %281 = load i64, i64* %UL, align 8
  %282 = load i32, i32* %ui, align 4
  %283 = zext i32 %282 to i64
  %284 = udiv i64 %281, %283
  %285 = trunc i64 %284 to i32
  %286 = mul i32 %280, %285
  store i32 %286, i32* %uidiv, align 4
  %287 = load i64, i64* %UL, align 8
  %288 = load i16, i16* %us, align 2
  %289 = zext i16 %288 to i64
  %290 = udiv i64 %287, %289
  %291 = trunc i64 %290 to i16
  %292 = zext i16 %291 to i32
  %293 = load i64, i64* %UL, align 8
  %294 = load i16, i16* %us, align 2
  %295 = zext i16 %294 to i64
  %296 = udiv i64 %293, %295
  %297 = trunc i64 %296 to i16
  %298 = zext i16 %297 to i32
  %299 = mul nsw i32 %292, %298
  %300 = trunc i32 %299 to i16
  store i16 %300, i16* %usdiv, align 2
  %301 = load i64, i64* %UL, align 8
  %302 = load i8, i8* %ub, align 1
  %303 = zext i8 %302 to i64
  %304 = udiv i64 %301, %303
  %305 = trunc i64 %304 to i8
  %306 = zext i8 %305 to i32
  %307 = load i64, i64* %UL, align 8
  %308 = load i8, i8* %ub, align 1
  %309 = zext i8 %308 to i64
  %310 = udiv i64 %307, %309
  %311 = trunc i64 %310 to i8
  %312 = zext i8 %311 to i32
  %313 = mul nsw i32 %306, %312
  %314 = trunc i32 %313 to i8
  store i8 %314, i8* %ubdiv, align 1
  %315 = load i64, i64* %L, align 8
  %316 = load i32, i32* %i, align 4
  %317 = sext i32 %316 to i64
  %318 = sdiv i64 %315, %317
  %319 = trunc i64 %318 to i32
  %320 = load i64, i64* %L, align 8
  %321 = load i32, i32* %i, align 4
  %322 = sext i32 %321 to i64
  %323 = sdiv i64 %320, %322
  %324 = trunc i64 %323 to i32
  %325 = mul nsw i32 %319, %324
  store i32 %325, i32* %idiv, align 4
  %326 = load i64, i64* %L, align 8
  %327 = load i16, i16* %s, align 2
  %328 = sext i16 %327 to i64
  %329 = sdiv i64 %326, %328
  %330 = trunc i64 %329 to i16
  %331 = sext i16 %330 to i32
  %332 = load i64, i64* %L, align 8
  %333 = load i16, i16* %s, align 2
  %334 = sext i16 %333 to i64
  %335 = sdiv i64 %332, %334
  %336 = trunc i64 %335 to i16
  %337 = sext i16 %336 to i32
  %338 = mul nsw i32 %331, %337
  %339 = trunc i32 %338 to i16
  store i16 %339, i16* %sdiv, align 2
  %340 = load i64, i64* %L, align 8
  %341 = load i8, i8* %b, align 1
  %342 = sext i8 %341 to i64
  %343 = sdiv i64 %340, %342
  %344 = trunc i64 %343 to i8
  %345 = sext i8 %344 to i32
  %346 = load i64, i64* %L, align 8
  %347 = load i8, i8* %b, align 1
  %348 = sext i8 %347 to i64
  %349 = sdiv i64 %346, %348
  %350 = trunc i64 %349 to i8
  %351 = sext i8 %350 to i32
  %352 = mul nsw i32 %345, %351
  %353 = trunc i32 %352 to i8
  store i8 %353, i8* %bdiv, align 1
  %354 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  %355 = load i32, i32* %uiprod, align 4
  %356 = load i32, i32* %uiprod, align 4
  %357 = load i32, i32* %uidiv, align 4
  %358 = load i32, i32* %uidiv, align 4
  %359 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.13, i32 0, i32 0), i32 %355, i32 %356, i32 %357, i32 %358)
  %360 = load i16, i16* %usprod, align 2
  %361 = zext i16 %360 to i32
  %362 = load i16, i16* %usprod, align 2
  %363 = zext i16 %362 to i32
  %364 = load i16, i16* %usdiv, align 2
  %365 = zext i16 %364 to i32
  %366 = load i16, i16* %usdiv, align 2
  %367 = zext i16 %366 to i32
  %368 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.14, i32 0, i32 0), i32 %361, i32 %363, i32 %365, i32 %367)
  %369 = load i8, i8* %ubprod, align 1
  %370 = zext i8 %369 to i32
  %371 = load i8, i8* %ubprod, align 1
  %372 = zext i8 %371 to i32
  %373 = load i8, i8* %ubdiv, align 1
  %374 = zext i8 %373 to i32
  %375 = load i8, i8* %ubdiv, align 1
  %376 = zext i8 %375 to i32
  %377 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.15, i32 0, i32 0), i32 %370, i32 %372, i32 %374, i32 %376)
  %378 = load i32, i32* %iprod, align 4
  %379 = load i32, i32* %iprod, align 4
  %380 = load i32, i32* %idiv, align 4
  %381 = load i32, i32* %idiv, align 4
  %382 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.16, i32 0, i32 0), i32 %378, i32 %379, i32 %380, i32 %381)
  %383 = load i16, i16* %sprod, align 2
  %384 = sext i16 %383 to i32
  %385 = load i16, i16* %sprod, align 2
  %386 = sext i16 %385 to i32
  %387 = load i16, i16* %sdiv, align 2
  %388 = sext i16 %387 to i32
  %389 = load i16, i16* %sdiv, align 2
  %390 = sext i16 %389 to i32
  %391 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.17, i32 0, i32 0), i32 %384, i32 %386, i32 %388, i32 %390)
  %392 = load i8, i8* %bprod, align 1
  %393 = sext i8 %392 to i32
  %394 = load i8, i8* %bprod, align 1
  %395 = sext i8 %394 to i32
  %396 = load i8, i8* %bdiv, align 1
  %397 = sext i8 %396 to i32
  %398 = load i8, i8* %bdiv, align 1
  %399 = sext i8 %398 to i32
  %400 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.18, i32 0, i32 0), i32 %393, i32 %395, i32 %397, i32 %399)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
