---
title: Fuzzy_entropy
date: 2023-03-08 22:04:30
---

{% raw %}


<section data-toggle="wy-nav-shift" class="wy-nav-content-wrap"><nav class="wy-nav-top" aria-label="移动版导航菜单" >
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../../index.html">Entropy theory</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="页面导航">
  <ul class="wy-breadcrumbs">
      <li><a href="../../index.html" class="icon icon-home"></a></li>
      <li class="breadcrumb-item active">模糊熵(Fuzzy entropy)</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="fuzzy-entropy">
<h1>模糊熵(Fuzzy entropy)<a class="headerlink" href="#fuzzy-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>基本原理<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>在样本熵的基础上引入了一种模糊隶属度函数得到了模糊熵。设有长度为 <span class="math notranslate nohighlight">\(N\)</span> 的时间序列 <span class="math notranslate nohighlight">\(X = \left\{ {x\left( 1 \right),x\left( 2 \right), \cdots ,x\left( N \right)} \right\}\)</span> ，模糊熵的计算步骤如下：</p>
<ol class="arabic simple">
<li><p>将时间序列 <span class="math notranslate nohighlight">\(X\)</span> 重构相空间，形成向量序列 <span class="math notranslate nohighlight">\(\left\{ {{x_m}\left( 1 \right),{x_m}\left( 2 \right), \cdots ,{x_m}\left( {N - m + 1} \right)} \right\}\)</span>  ，嵌入维度也就是向量的维度为 <span class="math notranslate nohighlight">\(m\)</span>  ，其中:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{x_m}\left( i \right) = \left\{ {x\left( i \right),x\left( {i + 1} \right), \cdots ,x\left( {i + m - 1} \right)} \right\} - x0\left( i \right),1 \le i \le N - m + 1 \tag{1}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>这里的 <span class="math notranslate nohighlight">\(x0\left( i \right)\)</span> 为基线向量，通过去除基线进行泛化。<span class="math notranslate nohighlight">\(x0\left( i \right)\)</span>  定义为</p>
</div>
<div class="math notranslate nohighlight">
\[x0\left( i \right) = \frac{1}{m}\sum\limits_{k = 0}^{m - 1} {{x_m}\left( {i + k} \right)} \tag{2}\]</div>
<ol class="arabic simple" start="2">
<li><p>定义距离 <span class="math notranslate nohighlight">\(d_{ij}^m\)</span> 为向量 <span class="math notranslate nohighlight">\({x_m}\left( i \right)\)</span> 和  <span class="math notranslate nohighlight">\({x_m}\left( j \right)\)</span> 对应元素差值绝对值的最大值，即切比雪夫距离:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[d_{ij}^m = d\left[ {{x_m}\left( i \right),{x_m}\left( j \right)} \right] = \mathop {\max }\limits_{k = 0, \cdots ,m - 1} \left( {\left| {\left( {x\left( {i + k} \right) - x0\left( i \right)} \right) - \left( {x\left( {j + k} \right) - x0\left( j \right)} \right)} \right|} \right) \tag{3}\]</div>
<ol class="arabic simple" start="3">
<li><p>给定模糊函数参数 <span class="math notranslate nohighlight">\(n\)</span> 和 <span class="math notranslate nohighlight">\(r\)</span> ，通过模糊函数  <span class="math notranslate nohighlight">\(\mu \left( {d_{ij}^m,n,r} \right)\)</span> 计算 <span class="math notranslate nohighlight">\({x_m}\left( j \right)\)</span> 对 <span class="math notranslate nohighlight">\({x_m}\left( i \right)\)</span>  的相似程度:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[D_{ij}^m\left( {n,r} \right) = \mu \left( {d_{ij}^m,n,r} \right) \tag{4}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>模糊函数 <span class="math notranslate nohighlight">\(\mu \left( {d_{ij}^m,n,r} \right)\)</span> 为指数函数，如下:</p>
</div>
<div class="math notranslate nohighlight">
\[\mu \left( d_{ij}^{m},n,r \right)=\exp \left( {-{{\left( d_{ij}^{m} \right)}^{n}}}/{r}\; \right) \tag{5}\]</div>
<ol class="arabic simple" start="4">
<li><p>定义函数 <span class="math notranslate nohighlight">\({\phi ^m}\left( {n,r} \right)\)</span> 为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{\phi ^m}\left( {n,r} \right) = \frac{1}{{N - m + 1}}\sum\limits_{i = 1}^{N - m + 1} {\left( {\frac{1}{{N - m}}\sum\limits_{j = 1,j \ne i}^{N - m + 1} {D_{ij}^m} } \right)}  \tag{6}\]</div>
<ol class="arabic simple" start="5">
<li><p>将维数 <span class="math notranslate nohighlight">\(m\)</span> 增加到 <span class="math notranslate nohighlight">\(m + 1\)</span>  ，重复以上（步骤1-步骤4），得到 <span class="math notranslate nohighlight">\({\phi ^{m + 1}}\left( {n,r} \right)\)</span></p></li>
<li><p>模糊熵可以被定义为</p></li>
</ol>
<div class="math notranslate nohighlight">
\[FuzzyEn\left( {m,n,r} \right) = \mathop {\lim }\limits_{N \to \infty } \left[ {\ln {\phi ^m}\left( {n,r} \right) - \ln {\phi ^{m + 1}}\left( {n,r} \right)} \right] \tag{7}\]</div>
<p>对于有限长度为 <span class="math notranslate nohighlight">\(N\)</span> 的序列，模糊熵可以被定义为</p>
<div class="math notranslate nohighlight">
\[FuzzyEn\left( {m,n,r,N} \right) = \ln {\phi ^m}\left( {n,r} \right) - \ln {\phi ^{m + 1}}\left( {n,r} \right) \tag{8}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<blockquote>
<div><p>模糊熵是由Chen等人 <a class="footnote-reference brackets" href="#id9" id="id2">1</a>，提出的，建议的参数选择为：</p>
</div></blockquote>
<ul class="simple">
<li><p>嵌入维度  <span class="math notranslate nohighlight">\(m=2\)</span></p></li>
<li><p>容限  <span class="math notranslate nohighlight">\(r\)</span>   一般取 <cite>0.1~0.25</cite> 倍时间序列的标准差（SD）。</p></li>
<li><p>参数 <span class="math notranslate nohighlight">\(n=2\)</span>  。在后续的仿真验证中，我们选择 <span class="math notranslate nohighlight">\(m=2\)</span> ,  <span class="math notranslate nohighlight">\(n=2\)</span> ，  <span class="math notranslate nohighlight">\(r = 0.15 \times {\rm{SD}}\)</span> 。</p></li>
</ul>
</div>
</section>
<section id="id3">
<h2>代码实现<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>这里假设您已经获得本项目的的所有代码，若您此时还未获得有关程序，请移步到  <a class="reference internal" href="../install.html"><span class="doc">安装说明</span></a></p>
<p>模糊熵(Fuzzy entropy)的核心程序为  <code class="docutils literal notranslate"><span class="pre">MultiscaleFuzzyEntropy_pdist_paran</span></code></p>
<div class="highlight-c++ notranslate"><div class="highlight"><pre><span></span><span class="n">function</span><span class="w"> </span><span class="n">MFE</span><span class="o">=</span><span class="n">MultiscaleFuzzyEntropy_pdist_paran</span><span class="p">(</span><span class="n">data</span><span class="p">,</span><span class="n">m</span><span class="p">,</span><span class="n">n</span><span class="p">,</span><span class="n">r</span><span class="p">,</span><span class="n">scale</span><span class="p">)</span><span class="w"></span>
<span class="w">    </span><span class="n">MFE</span><span class="o">=</span><span class="p">[];</span><span class="w"></span>
<span class="w">    </span><span class="k">for</span><span class="w"> </span><span class="n">j</span><span class="o">=</span><span class="mi">1</span><span class="o">:</span><span class="n">scale</span><span class="w"></span>
<span class="w">         </span><span class="n">Xs</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="n">Multi</span><span class="p">(</span><span class="n">data</span><span class="p">,</span><span class="n">j</span><span class="p">);</span><span class="w"></span>
<span class="w">         </span><span class="n">FE</span><span class="o">=</span><span class="n">FuzzyEntropy</span><span class="p">(</span><span class="n">Xs</span><span class="p">,</span><span class="n">m</span><span class="p">,</span><span class="n">n</span><span class="p">,</span><span class="n">r</span><span class="p">);</span><span class="w"></span>
<span class="w">         </span><span class="n">MFE</span><span class="o">=</span><span class="p">[</span><span class="n">MFE</span><span class="p">,</span><span class="n">FE</span><span class="p">];</span><span class="w"></span>
<span class="w">     </span><span class="n">end</span><span class="w"></span>
<span class="w"> </span><span class="n">end</span><span class="w"></span>
</pre></div>
</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>各输入参数的信息如下：</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>：输入的时间序列，为列向量</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code> :嵌入维度</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">r</span></code>  : 容限</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">scale</span></code> :尺度比</p></li>
</ul>
</div>
</section>
<section id="id4">
<h2>仿真验证<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<section id="id5">
<h3>模糊熵的脉冲检测结果<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="模糊熵的脉冲检测结果" src="/assets/FE.png" />
</figure>
</section>
<section id="id6">
<h3>多尺度模糊熵的故障分类可视化结果<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="多尺度模糊熵的故障分类可视化结果" src="/assets/MultiFuzzEn.png" />
</figure>
</section>
<section id="id7">
<h3>抗噪性分析<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="抗噪性分析" src="/assets/FE1.png" />
</figure>
</section>
<section id="id8">
<h3>计算效率结果<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="计算效率结果" src="/assets/FE2.png" />
</figure>
<dl class="footnote brackets">
<dt class="label" id="id9"><span class="brackets"><a class="fn-backref" href="#id2">1</a></span></dt>
<dd><ol class="upperalpha simple" start="23">
<li><p>Chen, Z. Wang, H. Xie, and W. Yu, “Characterization of Surface EMG Signal Based on Fuzzy Entropy,” IEEE Trans. Neural Syst. Rehabil. Eng., vol. 15, no. 2, pp. 266–272, Jun. 2007, doi: 10.1109/TNSRE.2007.897025.</p></li>
</ol>
</dd>
</dl>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="2%20Sample%20entropy%20.html" class="btn btn-neutral float-left" title="样本熵(Sample entropy)" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="4%20Permutation%20Entropy.html" class="btn btn-neutral float-right" title="排列熵(Permutation Entropy)" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

  
   

</footer>
        </div>
      </div>
    </section>
    
	
	
	{% endraw %}
