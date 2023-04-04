---
title: Entropy Theory
date: 2017-02-19 15:40:14
---

{% raw %}



    <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap">
        <nav class="wy-nav-top" aria-label="移动版导航菜单">
            <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
            <a href="#">Entropy theory</a>
        </nav>

        <div class="wy-nav-content">
            <div class="rst-content">
                <div role="navigation" aria-label="页面导航">
                    <ul class="wy-breadcrumbs">
                        <li>
                            <a href="#" class="icon icon-home"></a>
                        </li>
                        <li class="breadcrumb-item active">Welcome to Entropy theory’s Lab!</li>
                        <li class="wy-breadcrumbs-aside">
                            <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
                        </li>

                    </ul>
                    <hr/>
                </div>
                <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
                    <div itemprop="articleBody">

                        <section id="welcome-to-entropy-theory-s-lab">
                            <h1>Welcome to Entropy theory’s Lab!<a class="headerlink" href="#welcome-to-entropy-theory-s-lab" title="此标题的永久链接"></a></h1>
                            <section id="id1">
                                <h2>版权声明<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
                                <div class="admonition warning">
                                    <p class="admonition-title">警告</p>
                                    <p>欢迎下载及编辑(个人用途)，但未经作者同意必须保留此段声明，且不可用于商业用途，否则保留追究法律责任的权利。</p>
                                    <ul class="simple">
                                        <li>
                                            <p>作者：IMLAB</p>
                                        </li>
                                        <li>
                                            <p>博客：<a class="reference external" href="https://bambooxking.github.io">https://bambooxking.github.io</a></p>
                                        </li>
                                        <li>
                                            <p>Github地址：<a class="reference external" href="https://github.com/bambooxking/rst-tutorial">https://github.com/bambooxking/rst-tutorial</a></p>
                                        </li>
                                    </ul>
                                </div>
                                <div class="highlight-c notranslate">
                                    <div class="highlight"><pre><span></span>   -----------------------------------------------------------------------------------------------------------
    Layer (type)                 Input Shape                      Output Shape               Param #
  ===========================================================================================================
    BatchNorm1D-1              [[1, 75, 1000]]                   [1, 75, 1000]                 300
      Conv2D-6                [[1, 5, 1000, 15]]               [1, 32, 1000, 15]               192
      Conv2D-2                [[1, 5, 1000, 15]]               [1, 32, 1000, 15]              1,472
      Conv2D-3                [[1, 5, 1000, 15]]               [1, 32, 1000, 15]              1,472
      Sigmoid-1              [[1, 32, 1000, 15]]               [1, 32, 1000, 15]                0
      gate_cn-1               [[1, 5, 1000, 15]]               [1, 32, 1000, 15]                0
      Conv2D-1               [[1, 32, 1000, 15]]               [1, 32, 1000, 15]              1,056
  ConvTemporalGraphical-1 [[1, 32, 1000, 15], [1, 15, 15]] [[1, 32, 1000, 15], [1, 15, 15]]        0
      Conv2D-4               [[1, 32, 1000, 15]]               [1, 32, 1000, 15]              9,248
      Conv2D-5               [[1, 32, 1000, 15]]               [1, 32, 1000, 15]              9,248
      Sigmoid-2              [[1, 32, 1000, 15]]               [1, 32, 1000, 15]                0
      gate_cn-2              [[1, 32, 1000, 15]]               [1, 32, 1000, 15]                0
    BatchNorm2D-1            [[1, 32, 1000, 15]]               [1, 32, 1000, 15]               128
   st_gcn_block-1      [[1, 5, 1000, 15], [1, 15, 15]]         [1, 32, 1000, 15]                0
      Conv2D-12              [[1, 32, 1000, 15]]               [1, 64, 1000, 15]              2,112
      Conv2D-8               [[1, 32, 1000, 15]]               [1, 64, 1000, 15]             18,496
      Conv2D-9               [[1, 32, 1000, 15]]               [1, 64, 1000, 15]             18,496
      Sigmoid-3              [[1, 64, 1000, 15]]               [1, 64, 1000, 15]                0
      gate_cn-3              [[1, 32, 1000, 15]]               [1, 64, 1000, 15]                0
      Conv2D-7               [[1, 64, 1000, 15]]               [1, 64, 1000, 15]              4,160
ConvTemporalGraphical-2 [[1, 64, 1000, 15], [1, 15, 15]] [[1, 64, 1000, 15], [1, 15, 15]]        0
      Conv2D-10              [[1, 64, 1000, 15]]               [1, 64, 1000, 15]             36,928
      Conv2D-11              [[1, 64, 1000, 15]]               [1, 64, 1000, 15]             36,928
      Sigmoid-4              [[1, 64, 1000, 15]]               [1, 64, 1000, 15]                0
      gate_cn-4              [[1, 64, 1000, 15]]               [1, 64, 1000, 15]                0
    BatchNorm2D-2            [[1, 64, 1000, 15]]               [1, 64, 1000, 15]               256
   st_gcn_block-2      [[1, 32, 1000, 15], [1, 15, 15]]        [1, 64, 1000, 15]                0
      Conv2D-13              [[1, 64, 1000, 15]]               [1, 16, 1000, 15]              9,232
      Conv2D-14              [[1, 64, 1000, 15]]               [1, 16, 1000, 15]              9,232
      Sigmoid-5              [[1, 16, 1000, 15]]               [1, 16, 1000, 15]                0
      gate_cn-5              [[1, 64, 1000, 15]]               [1, 16, 1000, 15]                0
 AdaptiveAvgPool2D-1         [[1, 16, 1000, 15]]                 [1, 16, 1, 15]                 0
      Flatten-1                [[1, 16, 1, 15]]                     [1, 240]                    0
      Linear-1                    [[1, 240]]                        [1, 240]                 57,840
      Linear-2                    [[1, 240]]                         [1, 2]                    482
 ===========================================================================================================
 Total params: 217,278
 Trainable params: 216,594
 Non-trainable params: 684
 -----------------------------------------------------------------------------------------------------------
 Input size (MB): 0.06
 Forward/backward pass size (MB): 150.73
 Params size (MB): 0.83
Estimated Total Size (MB): 151.61
-----------------------------------------------------------------------------------------------------------
</pre></div>
                                </div>
                            </section>
                            <section id="id2">
                                <h2>目录<a class="headerlink" href="#id2" title="此标题的永久链接"></a></h2>
                                <div class="toctree-wrapper compound">
                                    <p class="caption" role="heading"><span class="caption-text">快速上手熵值</span></p>
                                    <ul>
                                        <li class="toctree-l1"><a class="reference internal" href="./install.html">安装说明</a>
                                            <ul>
                                                <li class="toctree-l2"><a class="reference internal" href="content/install.html#id2">一、简介</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/install.html#entropy-theory">二、Entropy theory源码获取</a></li>
                                            </ul>
                                        </li>
                                        <li class="toctree-l1"><a class="reference internal" href="content/quick_start.html">快速上手熵值</a>
                                            <ul>
                                                <li class="toctree-l2"><a class="reference internal" href="content/quick_start.html#id2">工况仿真</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/quick_start.html#id3">熵值提取特征</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/quick_start.html#id4">抗噪性分析</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/quick_start.html#id5">计算效率分析</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="toctree-wrapper compound">
                                    <p class="caption" role="heading"><span class="caption-text">Entropy theory 熵值理论</span></p>
                                    <ul>
                                        <li class="toctree-l1"><a class="reference internal" href="content/Entropy%20theory/1%20Approximate%20Entropy.html">近似熵(Approximate Entropy)</a>
                                            <ul>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/1%20Approximate%20Entropy.html#id1">基本原理</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/1%20Approximate%20Entropy.html#id3">代码实现</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/1%20Approximate%20Entropy.html#id4">仿真验证</a></li>
                                            </ul>
                                        </li>
                                        <li class="toctree-l1"><a class="reference internal" href="content/Entropy%20theory/2%20Sample%20entropy%20.html">样本熵(Sample entropy)</a>
                                            <ul>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/2%20Sample%20entropy%20.html#id1">基本原理</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/2%20Sample%20entropy%20.html#id3">代码实现</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/2%20Sample%20entropy%20.html#id4">仿真验证</a></li>
                                            </ul>
                                        </li>
                                        <li class="toctree-l1"><a class="reference internal" href="content/Entropy%20theory/3%20Fuzzy%20entropy.html">模糊熵(Fuzzy entropy)</a>
                                            <ul>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/3%20Fuzzy%20entropy.html#id1">基本原理</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/3%20Fuzzy%20entropy.html#id3">代码实现</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/3%20Fuzzy%20entropy.html#id4">仿真验证</a></li>
                                            </ul>
                                        </li>
                                        <li class="toctree-l1"><a class="reference internal" href="content/Entropy%20theory/4%20Permutation%20Entropy.html">排列熵(Permutation Entropy)</a>
                                            <ul>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/4%20Permutation%20Entropy.html#id1">基本原理</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/4%20Permutation%20Entropy.html#id3">代码实现</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/4%20Permutation%20Entropy.html#id4">仿真验证</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/4%20Permutation%20Entropy.html#id5">仿真验证</a></li>
                                            </ul>
                                        </li>
                                        <li class="toctree-l1"><a class="reference internal" href="content/Entropy%20theory/5%20Diversity%20Entropy.html">散度熵(Diversity Entropy)</a>
                                            <ul>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/5%20Diversity%20Entropy.html#id1">基本原理</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/5%20Diversity%20Entropy.html#id3">代码实现</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/5%20Diversity%20Entropy.html#id4">仿真验证</a></li>
                                            </ul>
                                        </li>
                                        <li class="toctree-l1"><a class="reference internal" href="content/Entropy%20theory/6%20Distribution%20Entropy.html">分布熵(Distribution Entropy)</a>
                                            <ul>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/6%20Distribution%20Entropy.html#id1">基本原理</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/6%20Distribution%20Entropy.html#id3">代码实现</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/6%20Distribution%20Entropy.html#id4">仿真验证</a></li>
                                            </ul>
                                        </li>
                                        <li class="toctree-l1"><a class="reference internal" href="content/Entropy%20theory/7%20Symbolic%20dynamic%20Entropy.html">符号动力学熵(Symbolic dynamic Entropy)</a>
                                            <ul>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/7%20Symbolic%20dynamic%20Entropy.html#id1">基本原理</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/7%20Symbolic%20dynamic%20Entropy.html#id3">代码实现</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/7%20Symbolic%20dynamic%20Entropy.html#id4">仿真验证</a></li>
                                            </ul>
                                        </li>
                                        <li class="toctree-l1"><a class="reference internal" href="content/Entropy%20theory/8%20Dispersion%20Entropy.html">色散熵(Dispersion Entropy)</a>
                                            <ul>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/8%20Dispersion%20Entropy.html#id1">基本原理</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/8%20Dispersion%20Entropy.html#id5">代码实现</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/Entropy%20theory/8%20Dispersion%20Entropy.html#id6">仿真验证</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="toctree-wrapper compound">
                                    <p class="caption" role="heading"><span class="caption-text">关于我们</span></p>
                                    <ul>
                                        <li class="toctree-l1"><a class="reference internal" href="content/about_us.html">关于IMLAB</a>
                                            <ul>
                                                <li class="toctree-l2"><a class="reference internal" href="content/about_us.html#id1">开源共享，共同进步</a></li>
                                                <li class="toctree-l2"><a class="reference internal" href="content/about_us.html#id2">联系方式</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <section id="id3">
                                    <h3>索引<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h3>
                                    <ul class="simple">
                                        <li>
                                            <p><a class="reference internal" href="genindex.html"><span class="std std-ref">索引</span></a></p>
                                        </li>
                                        <li>
                                            <p><a class="reference internal" href="py-modindex.html"><span class="std std-ref">模块索引</span></a></p>
                                        </li>
                                        <li>
                                            <p><a class="reference internal" href="search.html"><span class="std std-ref">搜索页面</span></a></p>
                                        </li>
                                    </ul>
                                </section>
                            </section>
                        </section>


                    </div>
                </div>
                <footer>
                    <div class="rst-footer-buttons" role="navigation" aria-label="页脚">
                        <a href="./install.html" class="btn btn-neutral float-right" title="安装说明" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
                    </div>

                    <hr/>

                   


                </footer>
            </div>
        </div>
    </section>
   
	
	
	{% endraw %}