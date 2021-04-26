// vaddr = inst_cal_tag()!!!
    void Inst2ModulePass::inst_set_tag(Value* vaddr, IRBuilder<> &builder, Module &M){
        // define dso_local void @set_tag(i64 %vaddr, i8 signext %1) #0 {
        //   %3 = alloca i64, align 8
        //   %4 = alloca i8, align 1
        //   %5 = alloca i8*, align 8
        //   store1 i64 %vaddr, i64* %3, align 8
        //   store2 i8 %1, i8* %4, align 1
        //   %6 = load i64, i64* %3, align 8
        //   %7 = inttoptr i64 %6 to i8*
        //   store3 i8* %7, i8** %5, align 8
        //   %8 = load i8, i8* %4, align 1
        //   %9 = load i8*, i8** %5, align 8
        //   store4 i8 %8, i8* %9, align 1
        //   ret void
        // }
        auto &CTX = M.getContext();
        Type *intTy1 = Type::getInt1Ty(CTX);
        Type *intTy8 = Type::getInt8Ty(CTX);
        Type *intTy64 = Type::getInt64Ty(CTX);
        Type *i8ptr = Type::getInt8PtrTy(CTX);
        Value *alloca3 = builder.CreateAlloca(intTy64, nullptr, "alloca3");
        Value *alloca4 = builder.CreateAlloca(intTy8, nullptr, "alloca4");
        Value *alloca5 = builder.CreateAlloca(i8ptr, nullptr, "alloca5");

        errs() << "alloca\n";

        Value *store1 = builder.CreateStore(vaddr, alloca3, false);
        errs() << "store\n";
        Value *eid = ConstantInt::get(intTy8, (0b10));
        Value *store2 = builder.CreateStore(eid, alloca4, false);
        errs() << "store\n";

        Value *load6 = builder.CreateLoad(alloca3, "load6");
        Value *inttoptr7 = builder.CreateIntToPtr(load6, i8ptr, "inttoptr7");

        Value *store3 = builder.CreateStore(inttoptr7, alloca5, false);

        Value *load8 = builder.CreateLoad(alloca4, "load8");
        Value *load9 = builder.CreateLoad(alloca5, "load9");

        Value *store4 = builder.CreateStore(load8, load9, false);
    }