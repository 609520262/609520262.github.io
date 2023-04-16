---
title: Dispersion_Entropy
date: 2023-03-08 22:08:48
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
      <li class="breadcrumb-item active">色散熵(Dispersion Entropy)</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="dispersion-entropy">
<h1>色散熵(Dispersion Entropy)<a class="headerlink" href="#dispersion-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>基本原理<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>给定长度为 <span class="math notranslate nohighlight">\(N\)</span> 的时间序列 <span class="math notranslate nohighlight">\(\left\{ {{x_1},{x_2}, \cdots ,{x_N}} \right\}\)</span> ，色散熵的计算步骤如下：</p>
<ol class="arabic simple">
<li><p>将 <span class="math notranslate nohighlight">\({x_j}\left( {j = 1,2, \cdots ,N} \right)\)</span> 映射到 <span class="math notranslate nohighlight">\(c\)</span> 类，并且将类标记为:math:<cite>1</cite> 到 <span class="math notranslate nohighlight">\(c\)</span> 。为此，首先使用正态累积分布函数(NCDF)将 <span class="math notranslate nohighlight">\(x\)</span> 映射到 <span class="math notranslate nohighlight">\(y = \left\{ {{y_1},{y_2}, \cdots ,{y_N}} \right\}\)</span> ，<span class="math notranslate nohighlight">\({y_j}\)</span>  为0-1的值。接下来，我们使用线性算法将每个 <span class="math notranslate nohighlight">\({y_j}\)</span> 赋值为从1到 <span class="math notranslate nohighlight">\(c\)</span> 的整数。对于映射后的信号的每个元素，使用 <span class="math notranslate nohighlight">\(z_j^c = {\rm{round}}\left( {c \cdot {y_j} + 0.5} \right)\)</span> 得到分类后的时间序列。<span class="math notranslate nohighlight">\(z_j^c\)</span> 表示分类后时间序列的第 <span class="math notranslate nohighlight">\(j\)</span> 个元素，通过四舍五入将 <span class="math notranslate nohighlight">\({y_j}\)</span> 增加或减少到一个整数类。</p></li>
<li><p>以嵌入维度 <span class="math notranslate nohighlight">\(m\)</span> 和时间延迟 <span class="math notranslate nohighlight">\(d\)</span> 对 <span class="math notranslate nohighlight">\(z_j^c\)</span> 进行相空间重构，得到 <span class="math notranslate nohighlight">\(N - \left( {m - 1} \right)d\)</span> 个嵌入向量 :</p></li>
</ol>
<div class="math notranslate nohighlight">
\[z_i^{m,c} = \left\{ {z_i^c,z_{i + d}^c, \cdots ,z_{i + \left( {m - 1} \right)d}^c} \right\},i = 1,2, \cdots ,N - \left( {m - 1} \right)d  \tag{1}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>时间序列的每个嵌入向量 <span class="math notranslate nohighlight">\(z_i^{m,c}\)</span> 被映射到一个色散模式 <span class="math notranslate nohighlight">\({\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}\)</span> ，其中 <span class="math notranslate nohighlight">\(z_i^c = {v_0},z_{i + d}^c = {v_1}, \cdots ,z_{i + \left( {m - 1} \right)d}^c = {v_{m - 1}}\)</span>  。因为每个嵌入向量 <span class="math notranslate nohighlight">\(z_i^{m,c}\)</span> 有 <span class="math notranslate nohighlight">\(m\)</span> 个元素，每个元素可能是1到 <span class="math notranslate nohighlight">\(c\)</span> 的整数，因此共有 :math:<a href="#id2"><span class="problematic" id="id3">`</span></a>{c^m}`种可能的色散模式。</p>
</div>
<ol class="arabic simple" start="3">
<li><p>对于 <span class="math notranslate nohighlight">\({c^m}\)</span> 种可能的色散模式，统计每种色散模式的概率:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[p\left( {{\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}} \right) = \frac{{{\rm{Number}}\left\{ {i|i \le N - \left( {m - 1} \right)d,z_i^{m,c}{\rm{ has type }}{\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}} \right\}}}{{N - \left( {m - 1} \right)d}} \tag{2}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p><span class="math notranslate nohighlight">\(p\left( {{\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}} \right)\)</span> 表示： <span class="math notranslate nohighlight">\(N - \left( {m - 1} \right)d\)</span> 个嵌入向量 <span class="math notranslate nohighlight">\(z_i^{m,c}\)</span>  中属于 <span class="math notranslate nohighlight">\({\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}\)</span> 色散模式的数量除以嵌入向量的总数 <span class="math notranslate nohighlight">\(N - \left( {m - 1} \right)d\)</span> 。</p>
</div>
<ol class="arabic simple" start="4">
<li><p>最后，色散熵可以被计算为：</p></li>
</ol>
<div class="math notranslate nohighlight">
\[DispEn\left( {x,m,c,d} \right) =  - \sum\limits_{\pi  = 1}^{{c^m}} {p\left( {{\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}} \right) \cdot \ln p\left( {{\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}} \right)}     \tag{3}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<p>色散熵是由Rostaghi等人 <a class="footnote-reference brackets" href="#id11" id="id4">1</a>，提出的，建议的参数选择为：</p>
<ul class="simple">
<li><p>嵌入维度  <span class="math notranslate nohighlight">\(m = 3\)</span></p></li>
<li><p><span class="math notranslate nohighlight">\(c=6\)</span></p></li>
</ul>
</div>
</section>
<section id="id5">
<h2>代码实现<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h2>
<p>这里假设您已经获得本项目的的所有代码，若您此时还未获得有关程序，请移步到  <a class="reference internal" href="../install.html"><span class="doc">安装说明</span></a></p>
<p>色散熵(Dispersion entropy)的核心程序为  <code class="docutils literal notranslate"><span class="pre">MultiDispEn</span></code></p>
<div class="highlight-c++ notranslate"><div class="highlight"><pre><span></span>function [MDE]=MultiDispEn(data,m,nc,tau,scale)

  MDE=[];
  data=data&#39;;
  for j=1:scale
     Xs = Multi(data,j,1);
     [de]=DisEn_NCDF(Xs&#39;,m,nc,tau);
     MDE=[MDE,de];
  end
end
</pre></div>
</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>各输入参数的信息如下：</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>：输入的时间序列，为列向量</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code> :嵌入维度</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">Sym</span></code> :符号序列</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">scale</span></code> :尺度比</p></li>
</ul>
</div>
</section>
<section id="id6">
<h2>仿真验证<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h2>
<section id="id7">
<h3>色散熵的脉冲检测结果<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="色散熵的脉冲检测结果" src="/assets/Downloads/单尺度脉冲检测结果/DispEn.emf.svg" />
</figure>
</section>
<section id="id8">
<h3>多尺度色散熵的故障分类可视化结果<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="多尺度色散熵的故障分类可视化结果" src="/assets/Downloads/多尺度可视化结果/MultiDispEn.emf.svg" />
</figure>
</section>
<section id="id9">
<h3>抗噪性分析<a class="headerlink" href="#id9" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="抗噪性分析" src="/assets/Downloads/抗噪性结果/DispEn.emf.svg" />
</figure>
</section>
<section id="id10">
<h3>计算效率结果<a class="headerlink" href="#id10" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="计算效率结果" src="/assets/Downloads/计算效率结果/DispEn.emf.svg" />
</figure>
<dl class="footnote brackets">
<dt class="label" id="id11"><span class="brackets"><a class="fn-backref" href="#id4">1</a></span></dt>
<dd><ol class="upperalpha simple" start="13">
<li><p>Rostaghi and H. Azami, “Dispersion Entropy: A Measure for Time-Series Analysis,” IEEE Signal Process. Lett., vol. 23, no. 5, pp. 610–614, May 2016, doi: 10.1109/LSP.2016.2542881.</p></li>
</ol>
</dd>
</dl>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="7%20Symbolic%20dynamic%20Entropy.html" class="btn btn-neutral float-left" title="符号动力学熵(Symbolic dynamic Entropy)" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="../about_us.html" class="btn btn-neutral float-right" title="关于IMLAB" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

  
   

</footer>
        </div>
      </div>
    </section>


  {% endraw %}