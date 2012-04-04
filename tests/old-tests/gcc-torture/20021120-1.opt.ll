; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021120-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@gd = common global [32 x double] zeroinitializer, align 16
@gf = common global [32 x float] zeroinitializer, align 16

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @foo(i32 %n) nounwind uwtable {
entry:
  %tmp1 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 0), align 16
  %tmp4 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 1), align 8
  %tmp7 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 2), align 16
  %tmp10 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 3), align 8
  %tmp13 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 4), align 16
  %tmp16 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 5), align 8
  %tmp19 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 6), align 16
  %tmp22 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 7), align 8
  %tmp25 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 8), align 16
  %tmp28 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 9), align 8
  %tmp31 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 10), align 16
  %tmp34 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 11), align 8
  %tmp37 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 12), align 16
  %tmp40 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 13), align 8
  %tmp43 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 14), align 16
  %tmp46 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 15), align 8
  %tmp49 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 16), align 16
  %tmp52 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 17), align 8
  %tmp55 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 18), align 16
  %tmp58 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 19), align 8
  %tmp61 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 20), align 16
  %tmp64 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 21), align 8
  %tmp67 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 22), align 16
  %tmp70 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 23), align 8
  %tmp73 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 24), align 16
  %tmp76 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 25), align 8
  %tmp79 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 26), align 16
  %tmp82 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 27), align 8
  %tmp85 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 28), align 16
  %tmp88 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 29), align 8
  %tmp91 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 30), align 16
  %tmp94 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 31), align 8
  %cmp33 = icmp sgt i32 %n, 0
  br i1 %cmp33, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %storemerge66 = phi i32 [ %0, %for.body ], [ 0, %entry ]
  %tmp769165 = phi double [ %add516, %for.body ], [ %tmp1, %entry ]
  %tmp772264 = phi double [ %add521, %for.body ], [ %tmp4, %entry ]
  %tmp775363 = phi double [ %add526, %for.body ], [ %tmp7, %entry ]
  %tmp778462 = phi double [ %add531, %for.body ], [ %tmp10, %entry ]
  %tmp781561 = phi double [ %add536, %for.body ], [ %tmp13, %entry ]
  %tmp784660 = phi double [ %add541, %for.body ], [ %tmp16, %entry ]
  %tmp787759 = phi double [ %add546, %for.body ], [ %tmp19, %entry ]
  %tmp790858 = phi double [ %add551, %for.body ], [ %tmp22, %entry ]
  %tmp793957 = phi double [ %add556, %for.body ], [ %tmp25, %entry ]
  %tmp7961056 = phi double [ %add561, %for.body ], [ %tmp28, %entry ]
  %tmp7991155 = phi double [ %add566, %for.body ], [ %tmp31, %entry ]
  %tmp8021254 = phi double [ %add571, %for.body ], [ %tmp34, %entry ]
  %tmp8051353 = phi double [ %add576, %for.body ], [ %tmp37, %entry ]
  %tmp8081452 = phi double [ %add581, %for.body ], [ %tmp40, %entry ]
  %tmp8111551 = phi double [ %add586, %for.body ], [ %tmp43, %entry ]
  %tmp8141650 = phi double [ %add591, %for.body ], [ %tmp46, %entry ]
  %tmp8171749 = phi double [ %add596, %for.body ], [ %tmp49, %entry ]
  %tmp8201848 = phi double [ %add601, %for.body ], [ %tmp52, %entry ]
  %tmp8231947 = phi double [ %add606, %for.body ], [ %tmp55, %entry ]
  %tmp8262046 = phi double [ %add611, %for.body ], [ %tmp58, %entry ]
  %tmp8292145 = phi double [ %add616, %for.body ], [ %tmp61, %entry ]
  %tmp8322244 = phi double [ %add621, %for.body ], [ %tmp64, %entry ]
  %tmp8352343 = phi double [ %add626, %for.body ], [ %tmp67, %entry ]
  %tmp8382442 = phi double [ %add631, %for.body ], [ %tmp70, %entry ]
  %tmp8412541 = phi double [ %add636, %for.body ], [ %tmp73, %entry ]
  %tmp8442640 = phi double [ %add641, %for.body ], [ %tmp76, %entry ]
  %tmp8472739 = phi double [ %add646, %for.body ], [ %tmp79, %entry ]
  %tmp8502838 = phi double [ %add651, %for.body ], [ %tmp82, %entry ]
  %tmp8532937 = phi double [ %add656, %for.body ], [ %tmp85, %entry ]
  %tmp8563036 = phi double [ %add661, %for.body ], [ %tmp88, %entry ]
  %tmp8593135 = phi double [ %add666, %for.body ], [ %tmp91, %entry ]
  %tmp8623234 = phi double [ %add671, %for.body ], [ %tmp94, %entry ]
  %tmp99 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 0), align 16
  %tmp102 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 1), align 4
  %tmp105 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 2), align 8
  %tmp108 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 3), align 4
  %tmp111 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 4), align 16
  %tmp114 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 5), align 4
  %tmp117 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 6), align 8
  %tmp120 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 7), align 4
  %tmp123 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 8), align 16
  %tmp126 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 9), align 4
  %tmp129 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 10), align 8
  %tmp132 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 11), align 4
  %tmp135 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 12), align 16
  %tmp138 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 13), align 4
  %tmp141 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 14), align 8
  %tmp144 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 15), align 4
  %tmp147 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 16), align 16
  %tmp150 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 17), align 4
  %tmp153 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 18), align 8
  %tmp156 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 19), align 4
  %tmp159 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 20), align 16
  %tmp162 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 21), align 4
  %tmp165 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 22), align 8
  %tmp168 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 23), align 4
  %tmp171 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 24), align 16
  %tmp174 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 25), align 4
  %tmp177 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 26), align 8
  %tmp180 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 27), align 4
  %tmp183 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 28), align 16
  %tmp186 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 29), align 4
  %tmp189 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 30), align 8
  %tmp192 = volatile load float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 31), align 4
  %tmp195 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 0), align 16
  %add = fadd double %tmp769165, %tmp195
  %tmp199 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 1), align 8
  %add201 = fadd double %tmp772264, %tmp199
  %tmp204 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 2), align 16
  %add206 = fadd double %tmp775363, %tmp204
  %tmp209 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 3), align 8
  %add211 = fadd double %tmp778462, %tmp209
  %tmp214 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 4), align 16
  %add216 = fadd double %tmp781561, %tmp214
  %tmp219 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 5), align 8
  %add221 = fadd double %tmp784660, %tmp219
  %tmp224 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 6), align 16
  %add226 = fadd double %tmp787759, %tmp224
  %tmp229 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 7), align 8
  %add231 = fadd double %tmp790858, %tmp229
  %tmp234 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 8), align 16
  %add236 = fadd double %tmp793957, %tmp234
  %tmp239 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 9), align 8
  %add241 = fadd double %tmp7961056, %tmp239
  %tmp244 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 10), align 16
  %add246 = fadd double %tmp7991155, %tmp244
  %tmp249 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 11), align 8
  %add251 = fadd double %tmp8021254, %tmp249
  %tmp254 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 12), align 16
  %add256 = fadd double %tmp8051353, %tmp254
  %tmp259 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 13), align 8
  %add261 = fadd double %tmp8081452, %tmp259
  %tmp264 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 14), align 16
  %add266 = fadd double %tmp8111551, %tmp264
  %tmp269 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 15), align 8
  %add271 = fadd double %tmp8141650, %tmp269
  %tmp274 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 16), align 16
  %add276 = fadd double %tmp8171749, %tmp274
  %tmp279 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 17), align 8
  %add281 = fadd double %tmp8201848, %tmp279
  %tmp284 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 18), align 16
  %add286 = fadd double %tmp8231947, %tmp284
  %tmp289 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 19), align 8
  %add291 = fadd double %tmp8262046, %tmp289
  %tmp294 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 20), align 16
  %add296 = fadd double %tmp8292145, %tmp294
  %tmp299 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 21), align 8
  %add301 = fadd double %tmp8322244, %tmp299
  %tmp304 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 22), align 16
  %add306 = fadd double %tmp8352343, %tmp304
  %tmp309 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 23), align 8
  %add311 = fadd double %tmp8382442, %tmp309
  %tmp314 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 24), align 16
  %add316 = fadd double %tmp8412541, %tmp314
  %tmp319 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 25), align 8
  %add321 = fadd double %tmp8442640, %tmp319
  %tmp324 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 26), align 16
  %add326 = fadd double %tmp8472739, %tmp324
  %tmp329 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 27), align 8
  %add331 = fadd double %tmp8502838, %tmp329
  %tmp334 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 28), align 16
  %add336 = fadd double %tmp8532937, %tmp334
  %tmp339 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 29), align 8
  %add341 = fadd double %tmp8563036, %tmp339
  %tmp344 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 30), align 16
  %add346 = fadd double %tmp8593135, %tmp344
  %tmp349 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 31), align 8
  %add351 = fadd double %tmp8623234, %tmp349
  %tmp354 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 0), align 16
  %add356 = fadd double %add, %tmp354
  %tmp359 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 1), align 8
  %add361 = fadd double %add201, %tmp359
  %tmp364 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 2), align 16
  %add366 = fadd double %add206, %tmp364
  %tmp369 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 3), align 8
  %add371 = fadd double %add211, %tmp369
  %tmp374 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 4), align 16
  %add376 = fadd double %add216, %tmp374
  %tmp379 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 5), align 8
  %add381 = fadd double %add221, %tmp379
  %tmp384 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 6), align 16
  %add386 = fadd double %add226, %tmp384
  %tmp389 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 7), align 8
  %add391 = fadd double %add231, %tmp389
  %tmp394 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 8), align 16
  %add396 = fadd double %add236, %tmp394
  %tmp399 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 9), align 8
  %add401 = fadd double %add241, %tmp399
  %tmp404 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 10), align 16
  %add406 = fadd double %add246, %tmp404
  %tmp409 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 11), align 8
  %add411 = fadd double %add251, %tmp409
  %tmp414 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 12), align 16
  %add416 = fadd double %add256, %tmp414
  %tmp419 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 13), align 8
  %add421 = fadd double %add261, %tmp419
  %tmp424 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 14), align 16
  %add426 = fadd double %add266, %tmp424
  %tmp429 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 15), align 8
  %add431 = fadd double %add271, %tmp429
  %tmp434 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 16), align 16
  %add436 = fadd double %add276, %tmp434
  %tmp439 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 17), align 8
  %add441 = fadd double %add281, %tmp439
  %tmp444 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 18), align 16
  %add446 = fadd double %add286, %tmp444
  %tmp449 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 19), align 8
  %add451 = fadd double %add291, %tmp449
  %tmp454 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 20), align 16
  %add456 = fadd double %add296, %tmp454
  %tmp459 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 21), align 8
  %add461 = fadd double %add301, %tmp459
  %tmp464 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 22), align 16
  %add466 = fadd double %add306, %tmp464
  %tmp469 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 23), align 8
  %add471 = fadd double %add311, %tmp469
  %tmp474 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 24), align 16
  %add476 = fadd double %add316, %tmp474
  %tmp479 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 25), align 8
  %add481 = fadd double %add321, %tmp479
  %tmp484 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 26), align 16
  %add486 = fadd double %add326, %tmp484
  %tmp489 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 27), align 8
  %add491 = fadd double %add331, %tmp489
  %tmp494 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 28), align 16
  %add496 = fadd double %add336, %tmp494
  %tmp499 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 29), align 8
  %add501 = fadd double %add341, %tmp499
  %tmp504 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 30), align 16
  %add506 = fadd double %add346, %tmp504
  %tmp509 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 31), align 8
  %add511 = fadd double %add351, %tmp509
  %tmp514 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 0), align 16
  %add516 = fadd double %add356, %tmp514
  %tmp519 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 1), align 8
  %add521 = fadd double %add361, %tmp519
  %tmp524 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 2), align 16
  %add526 = fadd double %add366, %tmp524
  %tmp529 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 3), align 8
  %add531 = fadd double %add371, %tmp529
  %tmp534 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 4), align 16
  %add536 = fadd double %add376, %tmp534
  %tmp539 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 5), align 8
  %add541 = fadd double %add381, %tmp539
  %tmp544 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 6), align 16
  %add546 = fadd double %add386, %tmp544
  %tmp549 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 7), align 8
  %add551 = fadd double %add391, %tmp549
  %tmp554 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 8), align 16
  %add556 = fadd double %add396, %tmp554
  %tmp559 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 9), align 8
  %add561 = fadd double %add401, %tmp559
  %tmp564 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 10), align 16
  %add566 = fadd double %add406, %tmp564
  %tmp569 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 11), align 8
  %add571 = fadd double %add411, %tmp569
  %tmp574 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 12), align 16
  %add576 = fadd double %add416, %tmp574
  %tmp579 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 13), align 8
  %add581 = fadd double %add421, %tmp579
  %tmp584 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 14), align 16
  %add586 = fadd double %add426, %tmp584
  %tmp589 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 15), align 8
  %add591 = fadd double %add431, %tmp589
  %tmp594 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 16), align 16
  %add596 = fadd double %add436, %tmp594
  %tmp599 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 17), align 8
  %add601 = fadd double %add441, %tmp599
  %tmp604 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 18), align 16
  %add606 = fadd double %add446, %tmp604
  %tmp609 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 19), align 8
  %add611 = fadd double %add451, %tmp609
  %tmp614 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 20), align 16
  %add616 = fadd double %add456, %tmp614
  %tmp619 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 21), align 8
  %add621 = fadd double %add461, %tmp619
  %tmp624 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 22), align 16
  %add626 = fadd double %add466, %tmp624
  %tmp629 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 23), align 8
  %add631 = fadd double %add471, %tmp629
  %tmp634 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 24), align 16
  %add636 = fadd double %add476, %tmp634
  %tmp639 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 25), align 8
  %add641 = fadd double %add481, %tmp639
  %tmp644 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 26), align 16
  %add646 = fadd double %add486, %tmp644
  %tmp649 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 27), align 8
  %add651 = fadd double %add491, %tmp649
  %tmp654 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 28), align 16
  %add656 = fadd double %add496, %tmp654
  %tmp659 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 29), align 8
  %add661 = fadd double %add501, %tmp659
  %tmp664 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 30), align 16
  %add666 = fadd double %add506, %tmp664
  %tmp669 = volatile load double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 31), align 8
  %add671 = fadd double %add511, %tmp669
  volatile store float %tmp99, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 0), align 16
  volatile store float %tmp102, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 1), align 4
  volatile store float %tmp105, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 2), align 8
  volatile store float %tmp108, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 3), align 4
  volatile store float %tmp111, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 4), align 16
  volatile store float %tmp114, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 5), align 4
  volatile store float %tmp117, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 6), align 8
  volatile store float %tmp120, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 7), align 4
  volatile store float %tmp123, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 8), align 16
  volatile store float %tmp126, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 9), align 4
  volatile store float %tmp129, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 10), align 8
  volatile store float %tmp132, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 11), align 4
  volatile store float %tmp135, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 12), align 16
  volatile store float %tmp138, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 13), align 4
  volatile store float %tmp141, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 14), align 8
  volatile store float %tmp144, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 15), align 4
  volatile store float %tmp147, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 16), align 16
  volatile store float %tmp150, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 17), align 4
  volatile store float %tmp153, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 18), align 8
  volatile store float %tmp156, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 19), align 4
  volatile store float %tmp159, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 20), align 16
  volatile store float %tmp162, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 21), align 4
  volatile store float %tmp165, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 22), align 8
  volatile store float %tmp168, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 23), align 4
  volatile store float %tmp171, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 24), align 16
  volatile store float %tmp174, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 25), align 4
  volatile store float %tmp177, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 26), align 8
  volatile store float %tmp180, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 27), align 4
  volatile store float %tmp183, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 28), align 16
  volatile store float %tmp186, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 29), align 4
  volatile store float %tmp189, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 30), align 8
  volatile store float %tmp192, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 31), align 4
  %0 = add nsw i32 %storemerge66, 1
  %exitcond = icmp eq i32 %0, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %tmp7691.lcssa = phi double [ %tmp1, %entry ], [ %add516, %for.body ]
  %tmp7722.lcssa = phi double [ %tmp4, %entry ], [ %add521, %for.body ]
  %tmp7753.lcssa = phi double [ %tmp7, %entry ], [ %add526, %for.body ]
  %tmp7784.lcssa = phi double [ %tmp10, %entry ], [ %add531, %for.body ]
  %tmp7815.lcssa = phi double [ %tmp13, %entry ], [ %add536, %for.body ]
  %tmp7846.lcssa = phi double [ %tmp16, %entry ], [ %add541, %for.body ]
  %tmp7877.lcssa = phi double [ %tmp19, %entry ], [ %add546, %for.body ]
  %tmp7908.lcssa = phi double [ %tmp22, %entry ], [ %add551, %for.body ]
  %tmp7939.lcssa = phi double [ %tmp25, %entry ], [ %add556, %for.body ]
  %tmp79610.lcssa = phi double [ %tmp28, %entry ], [ %add561, %for.body ]
  %tmp79911.lcssa = phi double [ %tmp31, %entry ], [ %add566, %for.body ]
  %tmp80212.lcssa = phi double [ %tmp34, %entry ], [ %add571, %for.body ]
  %tmp80513.lcssa = phi double [ %tmp37, %entry ], [ %add576, %for.body ]
  %tmp80814.lcssa = phi double [ %tmp40, %entry ], [ %add581, %for.body ]
  %tmp81115.lcssa = phi double [ %tmp43, %entry ], [ %add586, %for.body ]
  %tmp81416.lcssa = phi double [ %tmp46, %entry ], [ %add591, %for.body ]
  %tmp81717.lcssa = phi double [ %tmp49, %entry ], [ %add596, %for.body ]
  %tmp82018.lcssa = phi double [ %tmp52, %entry ], [ %add601, %for.body ]
  %tmp82319.lcssa = phi double [ %tmp55, %entry ], [ %add606, %for.body ]
  %tmp82620.lcssa = phi double [ %tmp58, %entry ], [ %add611, %for.body ]
  %tmp82921.lcssa = phi double [ %tmp61, %entry ], [ %add616, %for.body ]
  %tmp83222.lcssa = phi double [ %tmp64, %entry ], [ %add621, %for.body ]
  %tmp83523.lcssa = phi double [ %tmp67, %entry ], [ %add626, %for.body ]
  %tmp83824.lcssa = phi double [ %tmp70, %entry ], [ %add631, %for.body ]
  %tmp84125.lcssa = phi double [ %tmp73, %entry ], [ %add636, %for.body ]
  %tmp84426.lcssa = phi double [ %tmp76, %entry ], [ %add641, %for.body ]
  %tmp84727.lcssa = phi double [ %tmp79, %entry ], [ %add646, %for.body ]
  %tmp85028.lcssa = phi double [ %tmp82, %entry ], [ %add651, %for.body ]
  %tmp85329.lcssa = phi double [ %tmp85, %entry ], [ %add656, %for.body ]
  %tmp85630.lcssa = phi double [ %tmp88, %entry ], [ %add661, %for.body ]
  %tmp85931.lcssa = phi double [ %tmp91, %entry ], [ %add666, %for.body ]
  %tmp86232.lcssa = phi double [ %tmp94, %entry ], [ %add671, %for.body ]
  volatile store double %tmp7691.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 0), align 16
  volatile store double %tmp7722.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 1), align 8
  volatile store double %tmp7753.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 2), align 16
  volatile store double %tmp7784.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 3), align 8
  volatile store double %tmp7815.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 4), align 16
  volatile store double %tmp7846.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 5), align 8
  volatile store double %tmp7877.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 6), align 16
  volatile store double %tmp7908.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 7), align 8
  volatile store double %tmp7939.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 8), align 16
  volatile store double %tmp79610.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 9), align 8
  volatile store double %tmp79911.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 10), align 16
  volatile store double %tmp80212.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 11), align 8
  volatile store double %tmp80513.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 12), align 16
  volatile store double %tmp80814.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 13), align 8
  volatile store double %tmp81115.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 14), align 16
  volatile store double %tmp81416.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 15), align 8
  volatile store double %tmp81717.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 16), align 16
  volatile store double %tmp82018.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 17), align 8
  volatile store double %tmp82319.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 18), align 16
  volatile store double %tmp82620.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 19), align 8
  volatile store double %tmp82921.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 20), align 16
  volatile store double %tmp83222.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 21), align 8
  volatile store double %tmp83523.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 22), align 16
  volatile store double %tmp83824.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 23), align 8
  volatile store double %tmp84125.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 24), align 16
  volatile store double %tmp84426.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 25), align 8
  volatile store double %tmp84727.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 26), align 16
  volatile store double %tmp85028.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 27), align 8
  volatile store double %tmp85329.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 28), align 16
  volatile store double %tmp85630.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 29), align 8
  volatile store double %tmp85931.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 30), align 16
  volatile store double %tmp86232.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 31), align 8
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvar5 = phi i64 [ 0, %entry ], [ %indvar.next6, %for.body ]
  %storemerge2 = trunc i64 %indvar5 to i32
  %arrayidx7 = getelementptr [32 x float]* @gf, i64 0, i64 %indvar5
  %arrayidx = getelementptr [32 x double]* @gd, i64 0, i64 %indvar5
  %conv = sitofp i32 %storemerge2 to double
  volatile store double %conv, double* %arrayidx, align 8
  %conv4 = sitofp i32 %storemerge2 to float
  volatile store float %conv4, float* %arrayidx7, align 4
  %indvar.next6 = add i64 %indvar5, 1
  %exitcond = icmp eq i64 %indvar.next6, 32
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  tail call void @foo(i32 1)
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc30, %for.end
  %indvar = phi i64 [ %indvar.next, %for.inc30 ], [ 0, %for.end ]
  %arrayidx24 = getelementptr [32 x float]* @gf, i64 0, i64 %indvar
  %storemerge1 = trunc i64 %indvar to i32
  %cmp11 = icmp slt i32 %storemerge1, 32
  br i1 %cmp11, label %for.body13, label %for.end33

for.body13:                                       ; preds = %for.cond9
  %tmp = shl i64 %indvar, 2
  %mul = trunc i64 %tmp to i32
  %arrayidx16 = getelementptr [32 x double]* @gd, i64 0, i64 %indvar
  %tmp17 = volatile load double* %arrayidx16, align 8
  %conv19 = sitofp i32 %mul to double
  %cmp20 = fcmp une double %tmp17, %conv19
  br i1 %cmp20, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body13
  %tmp25 = volatile load float* %arrayidx24, align 4
  %conv27 = sitofp i32 %storemerge1 to float
  %cmp28 = fcmp une float %tmp25, %conv27
  br i1 %cmp28, label %if.then, label %for.inc30

if.then:                                          ; preds = %lor.lhs.false, %for.body13
  tail call void @abort() noreturn nounwind
  unreachable

for.inc30:                                        ; preds = %lor.lhs.false
  %indvar.next = add i64 %indvar, 1
  br label %for.cond9

for.end33:                                        ; preds = %for.cond9
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
