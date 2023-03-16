---
title: install
date: 2023-03-08 18:37:54
---

{% raw %}

 <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap">
      <nav class="wy-nav-top" aria-label="移动版导航菜单">
        <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
        <a href="../index.html">Entropy theory</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="页面导航">
            <ul class="wy-breadcrumbs">
              <li><a href="../index.html" class="icon icon-home"></a></li>
              <li class="breadcrumb-item active">安装说明</li>
              <li class="wy-breadcrumbs-aside">
                <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst"
                  class="fa fa-github"> 在 GitHub 上编辑</a>
              </li>

            </ul>
            <hr />
          </div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
            <div itemprop="articleBody">

              <section id="id1">
                <h1>安装说明<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h1>
                <section id="id2">
                  <h2>一、简介<a class="headerlink" href="#id2" title="此标题的永久链接"></a></h2>
                  <p>本章帮助您获得 <strong>Entropy theory</strong> 的所有源码以及配置您进行熵值实验的所需环境。</p>
                </section>
                <section id="entropy-theory">
                  <h2>二、Entropy theory源码获取<a class="headerlink" href="#entropy-theory" title="此标题的永久链接"></a></h2>
                  <p>本节内容将演示两种不同的获取Entropy theory的所有源码的方式：</p>
                  <blockquote>
                    <div>
                      <ul class="simple">
                        <li>
                          <p>克隆 <code class="docutils literal notranslate"><span class="pre">clone</span></code>
                            远程Entropy theory的方式</p>
                        </li>
                        <li>
                          <p>直接下载Entropy theory <code
                              class="docutils literal notranslate"><span class="pre">zip</span></code> 包</p>
                        </li>
                      </ul>
                    </div>
                  </blockquote>
                  <div class="admonition attention">
                    <p class="admonition-title">注意</p>
                    <p>假如您有一定的 <code class="docutils literal notranslate"><span class="pre">git</span></code>
                      使用经验，推荐您采用第一种 <strong>远程克隆</strong> 的方式获取本实验室的Entropy
                      theory的源码，我们将不间断地更新课题组实验室的最新熵值程序，确保您能够即使获取最新源码。</p>
                  </div>
                  <div class="admonition hint">
                    <p class="admonition-title">提示</p>
                    <p>Entropy theory源码基于 <a class="reference external"
                        href="https://ww2.mathworks.cn/products/matlab.html">MATLAB科学计算平台</a> 请确保您此时的MATLAB版本高于 <code
                        class="docutils literal notranslate"><span class="pre">2019</span></code> 。</p>
                  </div>
                  <section id="clone-entropy-theory">
                    <h3>克隆 <code class="docutils literal notranslate"><span class="pre">clone</span></code> 远程Entropy
                      theory<a class="headerlink" href="#clone-entropy-theory" title="此标题的永久链接"></a></h3>
                    <div class="highlight-console notranslate">
                      <div class="highlight">
                        <pre><span></span><span class="gp">$  </span>git clone https://github.com/609520262/Entropy-theory.git
</pre>
                      </div>
                    </div>
                  </section>
                  <section id="entropy-theory-zip">
                    <h3>直接下载Entropy theory <code
                        class="docutils literal notranslate"><span class="pre">zip</span></code> 包<a class="headerlink"
                        href="#entropy-theory-zip" title="此标题的永久链接"></a></h3>
                    <blockquote>
                      <div>
                        <p><a class="reference download internal" download=""
                            href="../_downloads/04fb00615324d1010037c581ca0caa0b/code.zip"><code
                              class="xref download docutils literal notranslate"><span class="pre">请点击此处</span></code></a>.您将获得Entropy
                          theory <code class="docutils literal notranslate"><span class="pre">zip</span></code> 包</p>
                      </div>
                    </blockquote>
                    <p>Entropy theory的代码框架如下：</p>
                    <div class="highlight-default notranslate">
                      <div class="highlight">
                        <pre><span></span>├── ApproximateEntropy.m
├── DEparameter.m
├── DistEn.m
├── MultiDispEn.m
├── MultiscaleFuzzyEntropy_pdist_paran.m
├── MultiscalePermutationEntropy.m
├── N205.mat
├── README.md
├── SampleEntropy.m
├── code_MSDE
│   ├── MultiscaleSymbolicDynamicEntropy.m
│   ├── PartitionGeneration.m
│   ├── SymbolEntropy.m
│   └── SymbolGeneration.m
├── code_MSDE.zip
├── main.asv
└── main.m
</pre>
                      </div>
                    </div>
                  </section>
                </section>
              </section>


            </div>
          </div>
          <footer>
            <div class="rst-footer-buttons" role="navigation" aria-label="页脚">
              <a href="../index.html" class="btn btn-neutral float-left" title="Welcome to Entropy theory’s Lab!"
                accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
              <a href="quick_start.html" class="btn btn-neutral float-right" title="快速上手熵值" accesskey="n" rel="next">下一页
                <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
            </div>

            <hr />

            <div role="contentinfo">
              <p>&#169; 版权所有 2022, IMLAB.</p>
            </div>

            利用 <a href="https://www.sphinx-doc.org/">Sphinx</a> 构建，使用的
            <a href="https://github.com/readthedocs/sphinx_rtd_theme">主题</a>
            由 <a href="https://readthedocs.org">Read the Docs</a> 开发.


          </footer>
        </div>
      </div>
    </section>


	{% endraw %}
