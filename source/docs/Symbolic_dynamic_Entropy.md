---
title: Symbolic_dynamic_Entropy
date: 2023-03-08 22:08:03
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
      <li class="breadcrumb-item active">符号动力学熵(Symbolic dynamic Entropy)</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="symbolic-dynamic-entropy">
<h1>符号动力学熵(Symbolic dynamic Entropy)<a class="headerlink" href="#symbolic-dynamic-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>基本原理<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>给定长度为 <span class="math notranslate nohighlight">\(N\)</span> 的时间序列  <span class="math notranslate nohighlight">\(\left\{ {u\left( i \right),1 \le i \le N} \right\}\)</span> ，符号动力学熵的计算步骤如下：</p>
<ol class="arabic simple">
<li><p>采用最大熵划分(MEP)对时间序列在振幅域上进行符号化。时间序列的元素转换为符号  <span class="math notranslate nohighlight">\({\sigma _i}\left( {i = 1,2, \cdots ,\varepsilon } \right)\)</span> 。可以得到符号化后的时间序列  <span class="math notranslate nohighlight">\(Z\left\{ {z\left( k \right),k = 1,2, \cdots ,N} \right\}\)</span> 。</p></li>
<li><p>对符号化时间序列进行相空间重构并计算可能的状态模式概率。嵌入维数为  <span class="math notranslate nohighlight">\(m\)</span> ，时间延迟为 <span class="math notranslate nohighlight">\(\lambda\)</span> 时，<span class="math notranslate nohighlight">\(Z\left\{ {z\left( k \right),k = 1,2, \cdots ,N} \right\}\)</span>  重构相空间后可以得到一系列的嵌入向量：</p></li>
</ol>
<div class="math notranslate nohighlight">
\[Z_j^{m,\lambda }\left\{ {z\left( j \right),z\left( {j + 1 \times \lambda } \right), \cdots ,z\left( {j + \left( {m - 1} \right) \times \lambda } \right)} \right\},j = 1,2, \cdots ,N - \left( {m - 1} \right)\lambda \tag{1}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>向量  <span class="math notranslate nohighlight">\(Z_j^{m,\lambda }\)</span>  有  <span class="math notranslate nohighlight">\(m\)</span>  个元素，每个元素有 <span class="math notranslate nohighlight">\(\varepsilon\)</span>  个可能的符号，因此共有 <span class="math notranslate nohighlight">\({\varepsilon ^m}\)</span>  种可能的状态模式。向量的状态可以表示为  <span class="math notranslate nohighlight">\(q_a^{\varepsilon ,m,\lambda }\left( {a = 1,2, \cdots ,{\varepsilon ^m}} \right)\)</span> 。因此，可能的状态模式的概率  <span class="math notranslate nohighlight">\(P\left( {q_a^{\varepsilon ,m,\lambda }} \right)\)</span> 可以按如下计算:</p>
</div>
<div class="math notranslate nohighlight">
\[P\left( {q_a^{\varepsilon ,m,\lambda }} \right) = \frac{{\left\| {\left\{ {j:j \le N - \left( {m - 1} \right)\lambda ,type\left( {Z_j^{\varepsilon ,m,\lambda }} \right) = q_a^{\varepsilon ,m,\lambda }} \right\}} \right\|}}{{N - \left( {m - 1} \right)\lambda }} \tag{2}\]</div>
<ol class="arabic simple" start="3">
<li><p>构造状态转移并计算状态转移概率。状态转移指的是符号化的时间序列会从一个状态转移到下一个状态(包括自循环)。当状态模式为 <span class="math notranslate nohighlight">\(q_a^{\varepsilon ,m,\lambda }\left( {a = 1,2, \cdots ,{\varepsilon ^m}} \right)\)</span> ，转移到下一个状态状态转移概率为符号 <span class="math notranslate nohighlight">\({\sigma _b}\left( {b = 1,2, \cdots ,\varepsilon } \right)\)</span> 的条件概率，如下:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[P\left( {{\sigma _b}|q_a^{\varepsilon ,m,\lambda }} \right) = P\left\{ {z\left( {j + m\lambda } \right) = {\sigma _b}|j:j \le N - m\lambda ,type\left( {Z_j^{\varepsilon ,m,\lambda }} \right) = q_a^{\varepsilon ,m,\lambda }} \right\}    \tag{3}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>其中 <span class="math notranslate nohighlight">\(a = 1,2, \cdots ,{\varepsilon ^m}\)</span> ，<span class="math notranslate nohighlight">\(b = 1,2, \cdots ,\varepsilon\)</span> ，<span class="math notranslate nohighlight">\(\varepsilon\)</span> 为符号数，<span class="math notranslate nohighlight">\({\varepsilon ^m}\)</span> 为状态数。状态概率满足条件 <span class="math notranslate nohighlight">\(\sum\limits_{b = 1}^\varepsilon  {P\left( {{\sigma _b}|q_a^{\varepsilon ,m,\lambda }} \right)}  = 1\)</span> 。 <span class="math notranslate nohighlight">\(P\left( {{\sigma _b}|q_a^{\varepsilon ,m,\lambda }} \right)\)</span> 可以表示为:</p>
</div>
<div class="math notranslate nohighlight">
\[P\left( {{\sigma _b}|q_a^{\varepsilon ,m,\lambda }} \right) = \frac{{\left\| {\left\{ {j:j \le N - m\lambda ,type\left( {Z_j^{\varepsilon ,m,\lambda }} \right) = q_a^{\varepsilon ,m,\lambda },z\left( {j + m\lambda } \right) = {\sigma _b}} \right\}} \right\|}}{{N - m\lambda }} \tag{4}\]</div>
<ol class="arabic simple" start="4">
<li><p>符号动力学熵定义为状态熵和状态转移熵的和，表示为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[SDE\left( {X,m,\lambda ,\varepsilon } \right) =  - \sum\limits_{a = 1}^{{\varepsilon ^m}} {P\left( {q_a^{\varepsilon ,m,\lambda }} \right)\ln P\left( {q_a^{\varepsilon ,m,\lambda }} \right)}  - \sum\limits_{a = 1}^{{\varepsilon ^m}} {\sum\limits_{b = 1}^\varepsilon  {P\left( {q_a^{\varepsilon ,m,\lambda }} \right)\ln \left( {P\left( {q_a^{\varepsilon ,m,\lambda }} \right)P\left( {{\sigma _b}|q_a^{\varepsilon ,m,\lambda }} \right)} \right)} }   \tag{5}\]</div>
<ol class="arabic simple" start="5">
<li><p>符号化熵的最大值为 <span class="math notranslate nohighlight">\(\ln \left( {{\varepsilon ^{m + 1}}} \right)\)</span> ，这时表示所有的状态概率和状态转移概率有都相同的值 <span class="math notranslate nohighlight">\(\left( P\left( q_{a}^{\varepsilon ,m,\lambda } \right)={1}/{{{\varepsilon }^{m}}}\;,P\left( {{\sigma }_{b}}|q_{a}^{\varepsilon ,m,\lambda } \right)={1}/{\varepsilon }\; \right)\)</span> 。可以得到标准化处理后的符号动力学熵表示为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[SDE\left( X,m,\lambda ,\varepsilon  \right)={SDE\left( X,m,\lambda ,\varepsilon  \right)}/{\ln \left( {{\varepsilon }^{m+1}} \right)} \tag{6}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<p>符号动力学熵是由Li等人 <a class="footnote-reference brackets" href="#id9" id="id2">1</a>，提出的，建议的参数选择为：</p>
<ul class="simple">
<li><p>嵌入维度  <span class="math notranslate nohighlight">\(m = 3\)</span></p></li>
<li><p>符号数  <span class="math notranslate nohighlight">\(\varepsilon  = 12\)</span></p></li>
<li><p>时间延迟  <span class="math notranslate nohighlight">\(\lambda  = 1\)</span></p></li>
</ul>
</div>
</section>
<section id="id3">
<h2>代码实现<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>这里假设您已经获得本项目的的所有代码，若您此时还未获得有关程序，请移步到  <a class="reference internal" href="../install.html"><span class="doc">安装说明</span></a></p>
<p>符号动力学熵(Symbolic dynamic Entropy)的核心程序为  <code class="docutils literal notranslate"><span class="pre">MultiscaleSymbolicDynamicEntropy</span></code></p>
<div class="highlight-c++ notranslate"><div class="highlight"><pre><span></span>function MSDE=MultiscaleSymbolicDynamicEntropy(data,m,Sym,scale)

   MSDE=[];
   data=data&#39;;
   for j=1:scale
      Xs = Multi(data,j,2);
      SDE=SymbolDynamicEntropy(Xs,m,Sym);
      MSDE=[MSDE,SDE];
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
<section id="id4">
<h2>仿真验证<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<section id="id5">
<h3>符号动力学熵的脉冲检测结果<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="符号动力学熵的脉冲检测结果" src="/assets/SDE.png" />
</figure>
</section>
<section id="id6">
<h3>多尺度符号动力学熵的故障分类可视化结果<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="多尺度符号动力学熵的故障分类可视化结果" src="/assets/MultiSymbolicDynamicEntropy.png" />
</figure>
</section>
<section id="id7">
<h3>抗噪性分析<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="抗噪性分析" src="/assets/SDE1.png" />
</figure>
</section>
<section id="id8">
<h3>计算效率结果<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="计算效率结果" src="/assets/SDE2.png" />
</figure>
<dl class="footnote brackets">
<dt class="label" id="id9"><span class="brackets"><a class="fn-backref" href="#id2">1</a></span></dt>
<dd><ol class="upperalpha simple" start="25">
<li><p>Li, Y. Yang, G. Li, M. Xu, and W. Huang, “A fault diagnosis scheme for planetary gearboxes using modified multi-scale symbolic dynamic entropy and mRMR feature selection,” Mech. Syst. Signal Process., vol. 91, pp. 295–312, Jul. 2017, doi: 10.1016/j.ymssp.2016.12.040.</p></li>
</ol>
</dd>
</dl>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="6%20Distribution%20Entropy.html" class="btn btn-neutral float-left" title="分布熵(Distribution Entropy)" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="8%20Dispersion%20Entropy.html" class="btn btn-neutral float-right" title="色散熵(Dispersion Entropy)" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

 
   

</footer>
        </div>
      </div>
    </section>


  {% endraw %}