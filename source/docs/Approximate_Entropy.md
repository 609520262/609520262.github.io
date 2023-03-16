---
title: Approximate_Entropy
date: 2023-03-08 21:55:23
---
{% raw %}


<section data-toggle="wy-nav-shift" class="wy-nav-content-wrap"><nav class="wy-nav-top" aria-label="移动版导航菜单" >
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../index.html">Entropy theory</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="页面导航">
  <ul class="wy-breadcrumbs">
      <li><a href="../index.html" class="icon icon-home"></a></li>
      <li class="breadcrumb-item active">近似熵(Approximate Entropy)</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="approximate-entropy">
<h1>近似熵(Approximate Entropy)<a class="headerlink" href="#approximate-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>基本原理<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>给定长度为 <span class="math notranslate nohighlight">\(\left\{ {x\left( i \right),i = 1,2, \cdots ,N} \right\}\)</span> 的时间序列  <span class="math notranslate nohighlight">\(\left\{ {x\left( i \right),i = 1,2, \cdots ,N} \right\}\)</span>，近似熵的计算步骤如下：</p>
<ol class="arabic simple">
<li><p>对 <span class="math notranslate nohighlight">\(X\)</span> 重构相空间，嵌入维度为 <span class="math notranslate nohighlight">\(m\)</span> ，形成 <span class="math notranslate nohighlight">\(m\)</span> 维的向量序列:，可以表示为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[\left\{ {X\left( 1 \right),X\left( 2 \right), \cdots ,X\left( {N - m + 1} \right)} \right\},X\left( i \right) = \left\{ {x\left( i \right),x\left( {i + 1} \right), \cdots ,x\left( {i + m - 1} \right)} \right\},1 \le i \le N - m + 1 \tag{1}\]</div>
<ol class="arabic simple" start="2">
<li><p>定义 <span class="math notranslate nohighlight">\(d\left[ {X\left( i \right),X\left( j \right)} \right]\)</span>  是向量  <span class="math notranslate nohighlight">\(X\left( i \right)\)</span> 和 <span class="math notranslate nohighlight">\(X\left( j \right)\)</span> 的切比雪夫距离，即两个向量对应元素之间差值绝对值的最大值:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[d\left[ {X\left( i \right),X\left( j \right)} \right] = \mathop {\max }\limits_{k = 0,1, \cdots ,m - 1} \left[ {\left| {x\left( {i + k} \right) - x\left( {j + k} \right)} \right|} \right] \tag{2}\]</div>
<p>对于 <span class="math notranslate nohighlight">\(X\left( i \right),1 \le i \le N - m + 1\)</span>，需要计算其与剩余其他向量 <span class="math notranslate nohighlight">\(X\left( j \right),1 \le j \le N,j \ne i\)</span> 之间的 <span class="math notranslate nohighlight">\(d\left[ {X\left( i \right),X\left( j \right)} \right]\)</span>。因此对任意 <span class="math notranslate nohighlight">\(X\left( i \right)\)</span> 都有  <span class="math notranslate nohighlight">\(N - m\)</span> 个距离 。</p>
<ol class="arabic simple" start="3">
<li><p>给定阈值 <span class="math notranslate nohighlight">\(r\)</span> ，对于所有的 <span class="math notranslate nohighlight">\(X\left( i \right)\)</span> ，统计 <span class="math notranslate nohighlight">\(d\left[ {X\left( i \right),X\left( j \right)} \right]\)</span> 中小于阈值 <span class="math notranslate nohighlight">\(r\)</span> 的数量，然后这个数量与总距离数 <span class="math notranslate nohighlight">\(N - m\)</span>  的比值记为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[C_i^m\left( r \right) = \frac{{{\rm{number}}\left\{ {i|1 \le i \le N - m + 1,d\left[ {X\left( i \right),X\left( j \right)} \right] &lt; r} \right\}}}{{N - m}} \tag{3}\]</div>
<ol class="arabic simple" start="4">
<li><p>对  <span class="math notranslate nohighlight">\(C_i^m\left( r \right)\)</span>  取对数，然后计算所有  <span class="math notranslate nohighlight">\(N - m + 1\)</span>  个 的均值，记为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{\phi ^m}\left( r \right) = \frac{1}{{N - m + 1}}\sum\limits_{i = 1}^{N - m + 1} {\ln C_i^m\left( r \right)} \tag{4}\]</div>
<ol class="arabic simple" start="5">
<li><p>将嵌入维度增加到 <span class="math notranslate nohighlight">\(m + 1\)</span>，重复以上步骤1-步骤4，得到  <span class="math notranslate nohighlight">\(C_i^{m + 1}\left( r \right)\)</span> 和 <span class="math notranslate nohighlight">\({\phi ^{m + 1}}\left( r \right)\)</span>。</p></li>
<li><p>理论上，近似熵可以被计算为：</p></li>
</ol>
<div class="math notranslate nohighlight">
\[ApEn\left( {m,r} \right) = \mathop {\lim }\limits_{N \to \infty } \left[ {{\phi ^m}\left( r \right) - {\phi ^{m + 1}}\left( r \right)} \right] \tag{5}\]</div>
<p>由于实际信号的 不能趋近于无穷大，有限序列的近似熵定义为:</p>
<div class="math notranslate nohighlight">
\[ApEn\left( {m,r,N} \right) = {\phi ^m}\left( r \right) - {\phi ^{m + 1}}\left( r \right) \tag{6}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<p>This is a note admonition.
近似熵是由Pincus<sup>[1]</sup>提出的，建议的参数选择为：</p>
<ul class="simple">
<li><p>嵌入维度  <span class="math notranslate nohighlight">\(m=2\)</span></p></li>
<li><p>容限  <span class="math notranslate nohighlight">\(r\)</span>   一般取 <cite>0.1~0.2</cite> 倍时间序列的标准差（SD）。在后续的仿真验证中，我们选择   <span class="math notranslate nohighlight">\(r = 0.15 \times {\rm{SD}}\)</span> 。</p></li>
</ul>
</div>
</section>
<section id="id2">
<h2>代码实现<a class="headerlink" href="#id2" title="此标题的永久链接"></a></h2>
<p>这里假设您已经获得本项目的的所有代码，若您此时还未获得有关程序，请移步到 <a class="reference internal" href="install.html"><span class="doc">安装说明</span></a></p>
<p>近似熵(Approximate Entropy)的核心程序为 <strong>ApproximateEntropy</strong></p>
<div class="highlight-sh notranslate"><div class="highlight"><pre><span></span><span class="k">function</span> <span class="nv">AE</span><span class="o">=</span>ApproximateEntropy<span class="o">(</span>data,m,r<span class="o">)</span>  % 输入的时间序列data为列向量即可
    <span class="nv">AE</span><span class="o">=</span>ApproximateEntropy1<span class="o">(</span>data,m,r<span class="o">)</span><span class="p">;</span>
end
</pre></div>
</div>
</section>
<section id="id3">
<h2>仿真验证<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<section id="id4">
<h3>近似熵的脉冲检测结果<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="近似熵的脉冲检测结果" src="../_images/aeClass.png" />
</figure>
</section>
<section id="id5">
<h3>多尺度近似熵的故障分类可视化结果<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="多尺度近似熵的故障分类可视化结果" src="../_images/aeEffecience.png" />
</figure>
</section>
</section>
</section>


           </div>
          </div>
          <footer>

  <hr/>

  

</footer>
        </div>
      </div>
    </section>


  {% endraw %}
