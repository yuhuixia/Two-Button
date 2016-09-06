# Two-Button
Two Button
仿照每日优鲜的 两行显示的首页的标题栏 用 UIButton 写的  支持文字和静态动态图片优先显示图片

#pragma mark - 这段代码是项目中用到的 具体数据
//        NSDictionary *dict = titleArray[i];
//        NSString *title = dict[@"name"];
//        NSString *imgUrl = dict[@"app_img"];
//
//        [button setTitle:title forState:(UIControlStateNormal)];
//        button.titleLabel.font = [UIFont systemFontOfSize:14];
//        [[SDWebImageManager sharedManager] downloadImageWithURL: [NSURL URLWithString:imgUrl] options:SDWebImageRetryFailed progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//            
//            if (image && finished) {
//                
//                [button sd_setImageWithURL:[NSURL URLWithString:imgUrl] forState:(UIControlStateNormal)];
//                [button sd_setImageWithURL:[NSURL URLWithString:imgUrl] forState:(UIControlStateHighlighted)];
//                [button setTitle:@"" forState:(UIControlStateNormal)];
//                [button.imageView setContentMode:UIViewContentModeScaleAspectFill];
//                
//            }
//        }];
以上这段代码是项目中实际的设置  就是优先显示图片 并且显示的 过程中优先出现文字 可根据项目需求自己设置 
代码写的比较粗糙  大牛请飘过~~~~~~~~~~~
感觉用的好的话 给个 Star 嘿嘿
