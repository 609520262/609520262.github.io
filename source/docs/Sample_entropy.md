---
title: Sample_entropy
date: 2023-03-08 22:03:41
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
      <li class="breadcrumb-item active">样本熵(Sample entropy)</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="sample-entropy">
<h1>样本熵(Sample entropy)<a class="headerlink" href="#sample-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>基本原理<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>设有长度为  <span class="math notranslate nohighlight">\(N\)</span>  的时间序列  <span class="math notranslate nohighlight">\(X = \left\{ {x\left( 1 \right),x\left( 2 \right), \cdots ,x\left( N \right)} \right\}\)</span> ，样本熵的计算步骤如下：</p>
<ol class="arabic simple">
<li><p>将时间序列  <span class="math notranslate nohighlight">\(X\)</span>  重构相空间，形成向量序列  <span class="math notranslate nohighlight">\(\left\{ {{x_m}\left( 1 \right),{x_m}\left( 2 \right), \cdots ,{x_m}\left( {N - m + 1} \right)} \right\}\)</span> ，嵌入维度也就是向量的维度为  <span class="math notranslate nohighlight">\(m\)</span>  ，其中:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{x_m}\left( i \right) = \left\{ {x\left( i \right),x\left( {i + 1} \right), \cdots ,x\left( {i + m - 1} \right)} \right\},1 \le i \le N - m + 1 \tag{1}\]</div>
<ol class="arabic simple" start="2">
<li><p>定义距离  <span class="math notranslate nohighlight">\(d\left[ {{x_m}\left( i \right),{x_m}\left( j \right)} \right]\)</span> 为向量 <span class="math notranslate nohighlight">\({x_m}\left( i \right)\)</span> 和  <span class="math notranslate nohighlight">\({x_m}\left( j \right)\)</span> 对应元素差值绝对值的最大值，即切比雪夫距离:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[d\left[ {{x_m}\left( i \right),{x_m}\left( j \right)} \right] = \mathop {\max }\limits_{k = 0, \cdots ,m - 1} \left( {\left| {x\left( {i + k} \right) - x\left( {j + k} \right)} \right|} \right) \tag{2}\]</div>
<ol class="arabic simple" start="3">
<li><p>给定容限  <span class="math notranslate nohighlight">\(r\)</span> ，对于固定的  <span class="math notranslate nohighlight">\({x_m}\left( i \right)\)</span> ，统计其与 <span class="math notranslate nohighlight">\({x_m}\left( j \right)\)</span> 之间的距离满足  <span class="math notranslate nohighlight">\(d\left[ {{x_m}\left( i \right),{x_m}\left( j \right)} \right] \le r,j \ne i\)</span>  的距离个数记为  <span class="math notranslate nohighlight">\({B_i}\)</span> ，总的距离数为  <span class="math notranslate nohighlight">\(N - m\)</span> ，定义:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[B_i^m\left( r \right) = \frac{1}{{N - m}}{B_i} \tag{3}\]</div>
<ol class="arabic simple" start="4">
<li><p>对  <span class="math notranslate nohighlight">\(1 \le i \le N - m + 1\)</span>，定义  <span class="math notranslate nohighlight">\({B^m}\left( r \right)\)</span> 为</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{B^m}\left( r \right) = \frac{1}{{N - m + 1}}\sum\limits_{i = 1}^{N - m + 1} {B_i^m\left( r \right)}  \tag{4}\]</div>
<ol class="arabic simple" start="5">
<li><p>将维数  <span class="math notranslate nohighlight">\(m\)</span> 增加到  <span class="math notranslate nohighlight">\(m+1\)</span> ，重复以上（步骤1-步骤4），得到 <span class="math notranslate nohighlight">\({B^{m + 1}}\left( r \right)\)</span></p></li>
<li><p>样本熵可以被定义为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[SampEn\left( {m,r} \right) = \mathop {\lim }\limits_{N \to \infty } \left\{ { - \ln \left[ {\frac{{{B^{m + 1}}\left( r \right)}}{{{B^m}\left( r \right)}}} \right]} \right\} \tag{5}\]</div>
<p>由于实际信号的 <span class="math notranslate nohighlight">\(N\)</span> 不能趋近于无穷大，因此有限序列的样本熵定义为:</p>
<div class="math notranslate nohighlight">
\[SampEn\left( {m,r,N} \right) =  - \ln \left[ {\frac{{{B^{m + 1}}\left( r \right)}}{{{B^m}\left( r \right)}}} \right] \tag{6}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<dl class="simple">
<dt>This is a note admonition.</dt><dd><p>样本熵是由Richman等人 <a class="footnote-reference brackets" href="#id9" id="id2">1</a>，提出的，建议的参数选择为：</p>
</dd>
</dl>
<ul class="simple">
<li><p>嵌入维度  <span class="math notranslate nohighlight">\(m=2\)</span></p></li>
<li><p>容限  <span class="math notranslate nohighlight">\(r\)</span>   一般取 <cite>0.1~0.25</cite> 倍时间序列的标准差（SD）。在后续的仿真验证中，我们选择 <span class="math notranslate nohighlight">\(m=2\)</span> ,   <span class="math notranslate nohighlight">\(r = 0.15 \times {\rm{SD}}\)</span> 。</p></li>
</ul>
</div>
</section>
<section id="id3">
<h2>代码实现<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>这里假设您已经获得本项目的的所有代码，若您此时还未获得有关程序，请移步到  <a class="reference internal" href="../install.html"><span class="doc">安装说明</span></a></p>
<p>样本熵(Sample entropy)的核心程序为 <code class="docutils literal notranslate"><span class="pre">ApproximateEntropy</span></code></p>
<div class="highlight-sh notranslate"><div class="highlight"><pre><span></span> <span class="k">function</span> <span class="nv">SE</span><span class="o">=</span>SampleEntropy<span class="o">(</span>data,m,r<span class="o">)</span>  % 输入的时间序列data为列向量即可
   <span class="nv">SE</span><span class="o">=</span>SampleEntropy1<span class="o">(</span>data,m,r<span class="o">)</span><span class="p">;</span>
end
</pre></div>
</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>各输入参数的信息如下：</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>：输入的时间序列，为列向量</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">r</span></code>  : 容限</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code> :嵌入维度</p></li>
</ul>
</div>
</section>
<section id="id4">
<h2>仿真验证<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<section id="id5">
<h3>样本熵的脉冲检测结果<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="样本熵的脉冲检测结果" src="/assets/SE.png" />
</figure>
</section>
<section id="id6">
<h3>多尺度样本熵的故障分类可视化结果<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="多尺度样本熵的故障分类可视化结果" src="/assets/MultiSE.png" />
</figure>
</section>
<section id="id7">
<h3>抗噪性分析<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="抗噪性分析" src="/assets/SE1.png" />
</figure>
</section>
<section id="id8">
<h3>计算效率结果<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="计算效率结果" src="/assets/SE2.png" />
</figure>
<dl class="footnote brackets">
<dt class="label" id="id9"><span class="brackets"><a class="fn-backref" href="#id2">1</a></span></dt>
<dd><ol class="upperalpha simple" start="10">
<li><ol class="upperalpha simple" start="19">
<li><p>Richman and J. R. Moorman, “Physiological time-series analysis using approximate entropy and sample entropy,” Am. J. Physiol.-Heart Circ. Physiol., vol. 278, no. 6, pp. H2039–H2049, Jun. 2000, doi: 10.1152/ajpheart.2000.278.6.H2039.</p></li>
</ol>
</li>
</ol>
</dd>
</dl>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="1%20Approximate%20Entropy.html" class="btn btn-neutral float-left" title="近似熵(Approximate Entropy)" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="3%20Fuzzy%20entropy.html" class="btn btn-neutral float-right" title="模糊熵(Fuzzy entropy)" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

  
   

</footer>
        </div>
      </div>
    </section>


  {% endraw %}
